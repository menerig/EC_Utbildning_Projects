from keras.models import load_model
from time import sleep
from keras.preprocessing.image import img_to_array, ImageDataGenerator
from keras.preprocessing import image
from keras.applications.mobilenet_v2 import preprocess_input
import cv2
import numpy as np
import pyttsx3
import threading

face_classifier = cv2.CascadeClassifier(r'C:\Users\makpe\OneDrive\Documents\Data Scientist\Deep Learning\Final_Project_DL_Oct_23\face_reg_software\haarcascade_frontalface_default.xml')
classifier =load_model(r'C:\Users\makpe\OneDrive\Documents\Data Scientist\Deep Learning\Final_Project_DL_Oct_23\face_rec.h5')

cap = cv2.VideoCapture(0)
engine = pyttsx3.init()

happy_points = 0

emotion_labels = ['Angry','Fear','Happy','Neutral', 'Sad', 'Surprise']

while True:
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
            label_position = (x, y -10)
            cv2.putText(frame, label, label_position, cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

        else:
            cv2.putText(frame, 'No Faces', (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

        joke = ['the chicken crossed the road']
        cv2.putText(frame, joke[0], (80, 400), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)

        if label == "Happy":
            happy_points += 1
            cv2.putText(frame, "You're gaining points!!", (30, 80), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
            cv2.putText(frame, f'{happy_points}', (30, 110), cv2.FONT_HERSHEY_SIMPLEX, 1, (0, 255, 0), 2)
    cv2.imshow('Emotion Detector', frame)
    
    if cv2.waitKey(1) & 0xFF == ord('q'):
        text_to_speak = f"You have {happy_points} happy points."
        engine.say(text_to_speak)
        
        if happy_points > 30:
            text_to_speak2 = "You have more than 30 points. You lose."
        else:
            text_to_speak2 = "You are under 30 points. You win."
            
        engine.say(text_to_speak2)
        engine.runAndWait()
        break

cap.release()
cv2.destroyAllWindows()

