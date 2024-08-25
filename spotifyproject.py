#!/usr/bin/env python
# coding: utf-8

# In[2]:


pip install spotipy 


# In[3]:


pip install spotipy pandas


# In[ ]:


import pandas as pd


# In[ ]:


import spotipy


# In[ ]:


from spotipy.oauth2 import SpotifyClientCredentials


# In[22]:


# Spotify API credentials
client_id = 'c618c1c6cf834caeb4c64b07553fa999'
client_secret = 'b363bb4eb053430ea7c6cfd24957b9a4'

# Set up the authentication
sp = spotipy.Spotify(auth_manager=SpotifyClientCredentials(client_id=client_id,
                                                           client_secret=client_secret))

# Load the dataset with a specific encoding
file_path = r'C:/Users/hp/Desktop/spotifyproject/spotify-2023.csv'
df = pd.read_csv(file_path, encoding='ISO-8859-1')

def get_album_cover_url(track_name, artist_name):
    """
    Fetch the album cover URL for a given track and artist from Spotify.

    Parameters:
    - track_name: Name of the track
    - artist_name: Name of the artist

    Returns:
    - URL of the album cover, or None if not found
    """
    try:
        results = sp.search(q=f"track:{track_name} artist:{artist_name}", type='track', limit=1)
        if results['tracks']['items']:
            return results['tracks']['items'][0]['album']['images'][0]['url']
    except Exception as e:
        print(f"Error fetching URL for {track_name} by {artist_name}: {e}")
    return None

# Apply the function to each row in the DataFrame
df['album_cover_url'] = df.apply(lambda row: get_album_cover_url(row['track_name'], row['artist_name']), axis=1)

# Save the updated dataset to a new CSV file
output_file_path = r'C:/Users/hp/Desktop/spotifyproject/spotify-2023-with-urls.csv'
df.to_csv(output_file_path, index=False)

print("Album cover URLs have been added and the updated file has been saved.")


# In[ ]:




