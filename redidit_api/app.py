import praw
from transformers import AutoTokenizer, AutoModelForSequenceClassification
from scipy.special import softmax
from flask import Flask, request
from flask_cors import CORS

app = Flask(__name__)
cors = CORS(app)

@app.route("/test")
def test():
    query = request.args.get("query", default="business")
    reddits = []
    wynik = 0
    roberta = "cardiffnlp/twitter-roberta-base-sentiment"
    model = AutoModelForSequenceClassification.from_pretrained(roberta)
    tokenizer = AutoTokenizer.from_pretrained(roberta)
    labels = ['Negative', 'Neutral', 'Positive']

    reddit = praw.Reddit(client_id='b7pGKmT-Fb3z3XVbln3_DQ',
                         client_secret='j35G5yTADIeGQMbyjnFYe0xth89TBg',
                         user_agent='Least_Leader_9637')

    top_posts = reddit.subreddit(query).top('week', limit=5)

    for submission in top_posts:
        reddits.append(submission.title)

    reddit_proc = " ".join([str(reddit) for reddit in reddits])

    encoded_reddits = tokenizer(reddit_proc, return_tensors='pt', max_length=512, truncation=True, padding=True)
    outputs = model(**encoded_reddits)
    scores = outputs[0].detach().numpy()
    scores = softmax(scores, axis=1)
    wynik += scores.sum(axis=0)

    sentiment = wynik

    return {
        "Subreddit": query,
        labels[0]: str(sentiment[0]),
        labels[1]: str(sentiment[1]),
        labels[2]: str(sentiment[2])
    }