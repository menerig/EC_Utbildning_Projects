from keras.models import load_model
from time import sleep
from keras.preprocessing.image import img_to_array
from keras.preprocessing import image
import cv2
import numpy as np
import pyttsx3
import threading

face_classifier = cv2.CascadeClassifier(r'C:\Users\makpe\OneDrive\Documents\Data Scientist\Deep Learning\Final_Project_DL_Oct_23\face_reg_software\haarcascade_frontalface_default.xml')
classifier =load_model(r'C:\Users\makpe\OneDrive\Documents\Data Scientist\Deep Learning\Final_Project_DL_Oct_23\face_rec.h5')

emotion_labels = ['Angry','Fear','Happy','Neutral', 'Sad', 'Surprise']

engine = pyttsx3.init()

cap = cv2.VideoCapture(0)

current_label = "Initial Label"
label_lock = threading.Lock()

def main_loop():
    global current_label
    while not exit_flag:
        _, frame = cap.read()
        labels = []
        gray = cv2.cvtColor(frame, cv2.COLOR_BGR2GRAY)
        faces = face_classifier.detectMultiScale(gray)

        for (x, y, w, h) in faces:
            cv2.rectangle(frame, (x, y), (x + w, y + h), (0, 255, 255), 2)
            roi_gray = gray[y:y + h, x:x + w]
            roi_gray = cv2.resize(roi_gray, (48, 48), interpolation=cv2.INTER_AREA)

            if np.sum([roi_gray]) != 0:
                roi = roi_gray.astype('float') / 255.0
                roi = img_to_array(roi)
                roi = np.expand_dims(roi, axis=0)

                prediction = classifier.predict(roi)[0]
                label = emotion_labels[prediction.argmax()]
                with label_lock:
                    current_label = label
                label_position = (x, y -10)
                cv2.putText(frame, label, label_position, cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
            else:
                cv2.putText(frame, 'No Faces', (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

        cv2.imshow('Emotion Detector', frame)
        
        if cv2.waitKey(1) & 0xFF == ord('q'):
            break 

    cap.release()
    cv2.destroyAllWindows()

def text_to_speech(): 
    while not exit_flag:
        with label_lock:
            label_to_use = current_label
        text_to_speak = f"You seem {label_to_use}. Do you want to talk about it?"
        engine.say(text_to_speak)
        engine.runAndWait()

# Set up an exit flag
exit_flag = False

# Create two threads for the main loop and text-to-speech
main_thread = threading.Thread(target=main_loop)
tts_thread = threading.Thread(target=text_to_speech, args=("Initial Label",))

# Start both threads as daemon threads
main_thread.daemon = True
tts_thread.daemon = True

# Start both threads
main_thread.start()

# Wait for user input to exit the program
input("Press Enter to exit...")
exit_flag = True  # Set the exit flag to True

# Wait for the main loop thread to finish before starting text-to-speech
main_thread.join()
tts_thread.join()

# Release resources
cap.release()
cv2.destroyAllWindows()
