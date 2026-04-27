# 🏭 Automatic Conveyor Sorting System using PLC (Ladder Logic)

## 📌 Project Overview

This project implements an **industrial-grade automated conveyor sorting system** using **PLC Ladder Logic**. The system is designed to detect objects on a conveyor belt, classify them as **metal or non-metal**, and automatically divert them to the appropriate output path using actuators.

The system incorporates **latching control, sensor-based decision-making, and timer-controlled actuation**, making it suitable for real-world industrial automation environments.

<img width="1920" height="1020" alt="Screenshot 2026-04-27 174349" src="https://github.com/user-attachments/assets/aeadd7b2-8026-4791-917e-f33fc3b6e353" />

<img width="1920" height="1020" alt="Screenshot 2026-04-27 174414" src="https://github.com/user-attachments/assets/36e53264-df21-46d7-bb78-f92c15dbbe6f" />

<img width="1920" height="1020" alt="Screenshot 2026-04-27 174427" src="https://github.com/user-attachments/assets/e6c4648b-d28e-4017-9f46-ac969c042684" />

<img width="1920" height="1020" alt="Screenshot 2026-04-27 174439" src="https://github.com/user-attachments/assets/5d5fc461-6ba8-41b2-8dbb-b69dd8728bd8" />

---

## 🎯 Objectives

* Automate material sorting on a conveyor system
* Reduce manual intervention and human error
* Implement real-time decision-making using PLC
* Demonstrate industrial PLC programming concepts

---

## ⚙️ System Architecture

### 🔹 Inputs

| Input         | Address | Description                |
| ------------- | ------- | -------------------------- |
| Start Button  | %IX0.0  | Starts the system          |
| Stop Button   | %IX0.1  | Stops the system           |
| Object Sensor | %IX0.2  | Detects presence of object |
| Metal Sensor  | %IX0.3  | Identifies metal objects   |

---

### 🔹 Outputs

| Output             | Address | Description               |
| ------------------ | ------- | ------------------------- |
| Conveyor Motor     | %QX0.0  | Drives conveyor belt      |
| Metal Diverter     | %QX0.1  | Diverts metal objects     |
| Non-Metal Diverter | %QX0.2  | Diverts non-metal objects |

---

### 🔹 Internal Variables

| Variable    | Type | Description                |
| ----------- | ---- | -------------------------- |
| object_flag | BOOL | Indicates object presence  |
| t1_done     | BOOL | Metal timer completion     |
| t2_done     | BOOL | Non-metal timer completion |

---

### 🔹 Timer Configuration

| Variable | Type | Value |
| -------- | ---- | ----- |
| pt1      | TIME | T#2s  |

---

## 🔄 Working Principle

### Step 1: System Start (Latching)

* Pressing the **Start button** activates the conveyor motor
* The system uses a **latching (seal-in) circuit** to maintain operation

---

### Step 2: Object Detection

* When an object passes the sensor:

  * `object_flag` is set to TRUE
* Ensures system processes only when objects are present

---

### Step 3: Material Classification

* Metal sensor checks object type:

  * If **metal → Metal Diverter ON**
  * If **non-metal → Non-Metal Diverter ON**

---

### Step 4: Sorting Action

* Appropriate diverter activates to redirect the object

---

### Step 5: Timer-Based Control

* A **TON (Timer ON Delay)** ensures:

  * Diverter stays ON only for a fixed duration (2 seconds)
* After delay:

  * Diverter automatically turns OFF

---

### Step 6: Continuous Operation

* System resets and prepares for the next object
* Loop continues until stopped

---

## 🪜 Ladder Logic Breakdown

### 🔹 Rung 1 – Latching Circuit

Maintains motor ON after start button is released.

### 🔹 Rung 2 – Object Detection

Detects object presence and sets internal flag.

### 🔹 Rung 3 – Metal Detection

Activates metal diverter if metal is detected.

### 🔹 Rung 4 – Non-Metal Detection

Activates non-metal diverter using NOT condition.

### 🔹 Rung 5 – Timer (Metal)

Starts timer when metal diverter is activated.

### 🔹 Rung 6 – Reset (Metal)

Turns OFF metal diverter after timer completes.

### 🔹 Rung 7 – Timer (Non-Metal)

Starts timer for non-metal diverter.

### 🔹 Rung 8 – Reset (Non-Metal)

Turns OFF non-metal diverter after delay.

---

## 🧠 Key Concepts Implemented

* ✅ PLC Latching (Seal-in Circuit)
* ✅ Sensor Integration
* ✅ Conditional Logic (AND / NOT)
* ✅ Timer (TON) Usage
* ✅ Industrial Automation Workflow

---

## 🏭 Industrial Applications

* Warehouse automation systems
* Packaging and sorting lines
* Manufacturing industries
* E-commerce logistics (automated sorting centers)

---

## 🚀 Advantages

* Reduces manual labor
* Improves sorting accuracy
* Increases operational efficiency
* Scalable for advanced automation systems

---

## 🔮 Future Enhancements

* Add **Emergency Stop (Safety Feature)**
* Implement **Counters for production tracking**
* Integrate **HMI for monitoring**
* Connect with **SCADA systems**
* Add **fault detection and alarms**

---

## 📌 Conclusion

This project demonstrates a **complete PLC-based automation system** that replicates real industrial sorting operations. It combines fundamental and advanced PLC concepts, making it an excellent foundation for understanding industrial automation and control systems.

---

## 👨‍💻 Author

**Vijayalakshmi S**
Electrical Automation Engineer

---


