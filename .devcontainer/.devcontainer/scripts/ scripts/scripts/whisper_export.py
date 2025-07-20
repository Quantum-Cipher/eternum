import csv
from datetime import datetime

log_path = "/workspace/logs/whisper_" + datetime.now().strftime("%Y%m%d%H%M") + ".csv"

with open(log_path, "w", newline='') as file:
    writer = csv.writer(file)
    writer.writerow(["Timestamp", "Message"])
    writer.writerow([datetime.now().isoformat(), "✨ Whisper log initialized"])
