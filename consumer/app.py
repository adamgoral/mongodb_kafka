import faust
import os

app = faust.App('consumer-app', broker=os.environ['KAFKA_BROKER'])

db_events = app.topic('quickstart.sampleData')

@app.agent(db_events)
async def db_events_agent(events):
    async for event in events:
        print(f'received {event}')