import os

file1 = open("Results.txt", "a")
file1.close()
file1 = open("Results.txt", "r+")
file1.truncate();
file1.close()

schedules = ["fcfs", "sjf", "rr", "priority", "priority_rr"]
filenames = ["book.txt", "pri-schedule.txt", "rr-schedule.txt", "schedule.txt", "testcase.txt"]

for sched in schedules:
  for files in filenames:
    file1 = open("Results.txt", "a")
    file1.write("Schedule: " + sched + ", File Used: " + files + "\nStart:\n")
    file1.close()
    str = "make " + sched
    os.system(str)
    print(files)
    str = "./" + sched + " " + files + " >> Results.txt"
    os.system(str)
    file1 = open("Results.txt", "a")
    file1.write("\n\n")
    file1.close()
