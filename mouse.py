import pyautogui
import time

screen_width, screen_height = pyautogui.size()

last_time = None

while True:
    
    x, y = pyautogui.position()

    
    if y >= screen_height - 1 or y <= 0:  
        if last_time is None:
            last_time = time.time()
        elif time.time() - last_time >= 2:
            if y >= screen_height - 1:
                pyautogui.moveTo(x, 0)  
            elif y <= 0:
                pyautogui.moveTo(x, screen_height - 1)  
            last_time = None 
    elif x <= 0:  
        pyautogui.moveTo(screen_width - 1, y)  
    elif x >= screen_width - 1:  
        pyautogui.moveTo(0, y) 
    else:
        last_time = None  
    
   
    time.sleep(0.10)  
