# accident_events.py
import datetime
import time
import random
import json
import uuid

# Possible values for each column with more realistic scenarios
locations = ["High Street", "Main Road", "Baker Street", "Elm Street", "Station Road", "Park Avenue"]
local_auth = ["City Council", "Township Authority", "County Police"]
severities = ["Low", "Medium", "High"]
road_conditions = ["Dry", "Wet", "Icy", "Snowy"]
weather_conditions = ["Clear", "Rainy", "Snowy", "Foggy", "Overcast"]
visibility_conditions = ["Good", "Moderate", "Poor"]
crossing_factors = ["Yes", "No"]
crossing_controls = ["Traffic Lights", "Zebra Crossing", "Pedestrian Lights", "None"]
speed_limits = [20, 30, 40, 50, 60, 70]

# Ensure Police Ref and Event ID are unique using a set
used_police_refs = set()
used_event_ids = set()

# Helper function to generate unique eventId and police_ref
def generate_unique_event_id():
    while True:
        event_id = str(uuid.uuid4())
        if event_id not in used_event_ids:
            used_event_ids.add(event_id)
            return event_id

def generate_unique_police_ref():
    while True:
        police_ref = "PR" + str(random.randint(10000, 99999))
        if police_ref not in used_police_refs:
            used_police_refs.add(police_ref)
            return police_ref

# Generate random date in the last year
def random_date():
    start_date = datetime.datetime.now() - datetime.timedelta(days=365)
    random_days = random.randint(0, 365)
    random_time = datetime.timedelta(hours=random.randint(0, 23), minutes=random.randint(0, 59), seconds=random.randint(0, 59))
    return start_date + datetime.timedelta(days=random_days) + random_time

# Generate fake accident event data with more realism
def generate_accident_event(offset=0):
    event_time = random_date()
    _event = {
        "eventId": generate_unique_event_id(),
        "eventOffset": offset,
        "Date": str(event_time.date()),
        "Time": event_time.strftime("%H:%M:%S"),
        "Easting": random.randint(500000, 600000),  # Assuming valid ranges for UK grid
        "Northing": random.randint(300000, 400000),  # Adjust for your specific context
        "Location": random.choice(locations),
        "Local_Auth": random.choice(local_auth),
        "Severity": random.choices(severities, weights=[50, 30, 20], k=1)[0],  # More likely to be low severity
        "Road_cond": random.choice(road_conditions),
        "Weather": random.choice(weather_conditions),
        "Visibility": random.choice(visibility_conditions),
        "Speed_Lim": random.choice(speed_limits),
        "Cross_fac": random.choice(crossing_factors),
        "Cross_ctrl": random.choice(crossing_controls),
        "Police_ref": generate_unique_police_ref(),
        "Casualties": random.randint(0, 4),
        "OAPs": random.randint(0, 4),  # Older Adults involved
        "Children": random.randint(0, 3),
        "Cycles": random.randint(0, 2),
        "P2W": random.randint(0, 2),  # Powered Two-Wheelers
        "Pedestrian": random.randint(0, 2),
        "Vehicles": random.randint(1, 4)
    }

    return json.dumps(_event)


if __name__ == "__main__":
    _offset = 10000
    while True:
        print(generate_accident_event(offset=_offset))
        time.sleep(random.randint(0, 5))
        _offset += 1
