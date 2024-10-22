from flask import Flask
from redis import Redis
import config as cfg

app = Flask(__name__)
redis = Redis(
  host=cfg.db_settings['redis']['host'],
  port=cfg.db_settings['redis']['port'])

@app.route('/')
def incr():
  redis.incr('hits')
  counter = str(redis.get('hits'),'utf-8')
  return f"This webpage has been hit {counter} time(s)\n"

@app.route('/reset')
def reset():
  redis.set('hits', 0)
  return "This webpage view counter has been reset\n"

@app.route('/auth')
def auth():
  return "What are you looking for??\n"

@app.route('/health')
def health():
  return {}

if __name__ == "__main__":
  app.run(host="0.0.0.0", port=8000, debug=True)
