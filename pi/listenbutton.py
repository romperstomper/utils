import subprocess
from gpiozero import Button
from signal import pause
import logging

BUTTON_PIN=3
script="/home/gary/src/utils/pi/button.sh"
button = Button(BUTTON_PIN, pull_up=True, bounce_time=0.1)
logging.basicConfig(level=logging.INFO, format='%(asctime)s - %(message)s')

def button_pressed():
    #logging.info("Button press detected! Executing script..")
    try:
        subprocess.run([script], check=True)

    except subprocess.CalledProcessError as e:
        logging.error(f"script failed: {e}")

button.when_pressed = button_pressed
#logging.info(f"GPIO Button listener started on ping {BUTTON_PIN}. Press CTRL+C to stop")
pause()
