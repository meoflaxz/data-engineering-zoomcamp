#### 1. Download google sdk to interact with google cloud using cli(terminal). Just follow the instruction. Nothing serious.
https://cloud.google.com/sdk/docs/install
<br></br>

#### 2. Verified with gcloud -v if successfully installed in your machine.
<code>gcloud -v
</code>
<br></br>

#### 3. Start the gcloud cli in your machine. Prompt your projects and email related. Can also be used if you want to change email or project.   
<code>gcloud init
</code>
<br></br>

#### 4. From your gcloud, export the keys(credentials) that act as login. IAM and admin > Service Accounts > Add Key. Saved it to local in JSON. Never share online.
<br></br>

#### 5. Set environment path so that gcloud cli can find the key (to access your online gcloud)
<code>GOOGLE_APPLICATION_CREDENTIALS >> [path/you/saved/the/key]</code>
<br></br>

#### 6. Accessing your gcloud from cli
<code>gcloud auth application-default login</code>