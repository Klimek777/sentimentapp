import requests

#test if the endpoint / return results for 'business' value
def test_endpoint():
    response = requests.get("http://127.0.0.1:5000/")
    data = response.json()

    assert response.status_code == 200
    assert data["Subreddit"] == "business"
    assert "Negative" in data
    assert "Neutral" in data
    assert "Positive" in data


#test if custom query will retrun right results for this query
def test_custom_query():
    query = "python"
    response = requests.get(f"http://127.0.0.1:5000/?query={query}")
    data = response.json()

    assert response.status_code == 200
    assert data["Subreddit"] == query
    assert "Negative" in data
    assert "Neutral" in data
    assert "Positive" in data


# test if the values of sentiment analysis are correct and within expected range of values

def test_sentiment_scores():
    response = requests.get("http://127.0.0.1:5000/")
    data = response.json()

    assert response.status_code == 200
    assert isinstance(float(data["Negative"]), float)
    assert isinstance(float(data["Neutral"]), float)
    assert isinstance(float(data["Positive"]), float)
    assert 0 <= float(data["Negative"]) <= 1
    assert 0 <= float(data["Neutral"]) <= 1
    assert 0 <= float(data["Positive"]) <= 1


#test if the model is loading in a right way and returns the right data

def test_model_loading():
    response = requests.get("http://127.0.0.1:5000/")
    data = response.json()

    assert response.status_code == 200
    assert "Negative" in data
    assert "Neutral" in data
    assert "Positive" in data
    assert data["Negative"] != "0.0"
    assert data["Neutral"] != "0.0"
    assert data["Positive"] != "0.0"


# test if the right data format is being returned 
def test_response_format():
    response = requests.get("http://127.0.0.1:5000/")
    data = response.json()

    assert response.status_code == 200
    assert isinstance(data, dict)
    assert "Subreddit" in data
    assert isinstance(data["Subreddit"], str)
    assert "Negative" in data
    assert "Neutral" in data
    assert "Positive" in data
    assert isinstance(data["Negative"], str)
    assert isinstance(data["Neutral"], str)
    assert isinstance(data["Positive"], str)


#test if the received sentiment scores have correct sums for each category.
def test_sentiment_sums():
    response = requests.get("http://127.0.0.1:5000/")
    data = response.json()

    assert response.status_code == 200
    assert isinstance(float(data["Negative"]), float)
    assert isinstance(float(data["Neutral"]), float)
    assert isinstance(float(data["Positive"]), float)
    assert 0 <= float(data["Negative"]) <= 1
    assert 0 <= float(data["Neutral"]) <= 1
    assert 0 <= float(data["Positive"]) <= 1
    assert (
        round(float(data["Negative"]) + float(data["Neutral"]) + float(data["Positive"]), 2)
        == 1.0
    )

