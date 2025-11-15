import pyautogui    
import time

# Espera 2 segundos para você se preparar
time.sleep(2)

# Pressiona a tecla Windows
pyautogui.press('win')
time.sleep(1)

# Digita "Calculadora"
pyautogui.write('Calculadora', interval=0.1)
time.sleep(1)

# Pressiona Enter para abrir
pyautogui.press('enter')
