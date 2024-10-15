# post_to_kafka.py
from kafka import KafkaProducer
import time
import random
from accident_events import generate_accident_event
import uuid

__bootstrap_server = "ed-kafka:29092"  # Using Docker : ed-kafka:29092

def post_to_kafka(data):
    print('data: ' + str(data))
    producer = KafkaProducer(bootstrap_servers=__bootstrap_server)
    producer.send('accident-data', key=bytes(str(uuid.uuid4()), 'utf-8'), value=data)
    producer.close()
    print("Posted to topic")


if __name__ == "__main__":
    _offset = 10000
    while True:
        post_to_kafka(bytes(str(generate_accident_event(offset=_offset)), 'utf-8'))
        time.sleep(random.randint(0, 1))
        _offset += 1
