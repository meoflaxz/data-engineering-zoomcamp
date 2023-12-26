### This is step by step on how to ssh into VM in the GCP.

* #### In high level overview, you need 3 things. GCP, your local machine (client), and the credentials (to access VM in GCP from local - this is what we call as <code>key</code>).

* #### You can do either create your VM first or create the SSH key first. It does not matter much.

* #### Let's say you want to create VM first (or any other instance you want). So next thing you do is configuring the ssh key to access it.

* #### Before that, create <code>.ssh</code> directory to store the key credentials. This can be anywhere and please put it in <code>.gitignore</code> files. **IMPORTANT**

* #### In this directory, write below syntax vvvvv

<br> 

### <code>ssh-keygen -t rsa -f ~/.ssh/KEY_FILENAME -C USERNAME -b 2048</code>

* #### <code>-t rsa</code>: Specifies the type of key to create, in this case, RSA. RSA is a widely used public-key cryptosystem.

* #### <code>-f ~/.ssh/KEY_FILENAME</code>: Specifies the filename of the generated key pair. The ~ represents the user's home directory, and KEY_FILENAME is the name you provide for your SSH key files. For example, if you specify id_rsa as the filename, the private key will be stored in ~/.ssh/id_rsa, and the public key will be stored in ~/.ssh/id_rsa.pub.

* #### <code>-C USERNAME</code>: Adds a comment to the key file. This is typically used to identify the user associated with the key. In this case, replace USERNAME with your actual username or any comment you find useful for identifying the key.

* #### <code>-b 2048</code>: Specifies the number of bits in the key. In this example, a key length of 2048 bits is chosen. Longer key lengths generally provide stronger security, but they may also require more computational resources.
  

<br>

#### For this project, I write it as this: <code>ssh-keygen -t rsa -f gcp -C meoflaxz -b 2048</code>

* #### 2 files will be created. Your <code>KEY_FILENAME</code> and <code>KEY_FILENAME</code>.pub

* #### Copy all the stuff within <code>KEY_FILENAME</code>.pub and put it in the **Setings > Metadata > SSH Keys** in your GCP VM page. And you will be done for configuring the SSH keys in your VM settings.
* #### Now let's proceed with connecting to your GCP from your local. Use this syntax - <code>ssh -i KEY_FILENAME USERNAME@[host]</code>. You can get the host aka ip address from the external ip address from the VM Instances page, where you can see your created VM previously.
* #### If there's any error, one way you can fix is using <code>ssh-keygen -R [host]</code> to update the user.
* #### Great! Now you are in your VM machine. Have fun!
