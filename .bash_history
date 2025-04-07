mkdir reverse-ip-app
cd reverse-ip-app
echo "from flask import Flask, request
import sqlite3

app = Flask(__name__)

# Database setup
def init_db():
    conn = sqlite3.connect('ip_storage.db')
    c = conn.cursor()
    c.execute('CREATE TABLE IF NOT EXISTS ip_records (id INTEGER PRIMARY KEY, reverse_ip TEXT)')
    conn.commit()
    conn.close()

@app.route('/')
def home():
    public_ip = request.remote_addr
    reverse_ip = '.'.join(public_ip.split('.')[::-1])
    
    # Store reverse IP in the database
    conn = sqlite3.connect('ip_storage.db')
    c = conn.cursor()
    c.execute('INSERT INTO ip_records (reverse_ip) VALUES (?)', (reverse_ip,))
    conn.commit()
    conn.close()
    
    return reverse_ip

if __name__ == '__main__':
    init_db()
    app.run(host='0.0.0.0', port=5000)" > app.py
cat app.py
gcloud services enable sqladmin.googleapis.com
gcloud sql instances create reverse-ip-db --database-version=MYSQL_8_0 --tier=db-f1-micro --region=us-central1
gcloud sql users set-password root --instance=<reverse-ip-db> --password=<password14>
gcloud sql users ser-password root --instance=reverse-ip-db --password=password14
gcloud sql users set-password root --instance=reverse-ip-db --password=password14
gcloud sql databases create reverse_ips --instance=reverse-ip-db
gcloud sql connect reverse-ip-db --user=root
gcloud sql users set-password root --instance=reverse-ip-db --password=password14
gcloud sql connect reverse-ip-db --user=root
gcloud sql instances describe reverse-ip-db
gcloud sql connect reverse-ip-db --user=root --quiet
gcloud sql users set-password root --instance=reverse-ip-db --password=password14
apt-get install mysql-client
gcloud sql users set-password root --instance=reverse-ip-db --password=password14
gcloud sql connect reverse-ip-db --user=root
SELECT User, Host FROM mysql.user;
gcloud sql connect reverse-ip-db --user=root
gcloud sql users set-password root --instance=reverse-ip-db --password=SimplePassword123
gcloud sql connect reverse-ip-db --user=root
gcloud sql users create newuser --instance=reverse-ip-db --password=NewPass123
gcloud sql connect reverse-ip-db --user=newuser
gcloud sql connect reverse-ip-db --user=root
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
gcloud sql connect reverse-ip-db --user=root
GRANT ALL PRIVILEGES ON *.* TO 'newuser'@'%' WITH GRANT OPTION;
FLUSH PRIVILEGES;
gcloud sql connect reverse-ip-db --user=root
docker build -t reverse-ip-app .
nano requirements.txt
nano Dockerfile
ls
docker build -t reverse-ip-app .
ls
nano app.py
ls
docker build -t reverse-ip-app .
helm create reverse-ip-chart
ls
cd reverse-ip-chart/templates
nano deployments.yaml
nano values.yaml
nano service.yaml
mkdir -p .github/workflows
ls
mkdir -p .github/workflows
nano .github/workflows/deploy.yml
ls
cd Dockerfile
nano Dockerfile
gcloud auth configure-docker
gcloud projects list
echo -n '{"username": "saiteja3497","password": "Saiteja@123."} > docker_credentials.json
gcloud secrets create my-docker-credentials --data-file=docker_credentials.json

gcloud projects describe <YOUR_PROJECT_ID>
gcloud secrets add-iam-policy-binding my-docker-credentials \
    --member=serviceAccount:681909333795@cloudbuild.gserviceaccount.com \
    --role=roles/secretmanager.secretAccessor

echo -n '{"username": "saiteja3497","password": "Saiteja@123."} > docker_credentials.json
echo -n '{"username": "saiteja3497", "password": "Saiteja@123."}' > docker_credentials.json
gcloud secrets create my-docker-credentials --data-file=docker_credentials.json
gcloud projects describe <YOUR_PROJECT_ID>
gcloud projects list
gcloud projects describe reverse-ip-51286
gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:681909333795@cloudbuild.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
gcloud projects list
gcloud secrets add-iam-policy-binding my-docker-credentials  --member=serviceAccount : 681909333795@cloudbuild.gserviceaccount.com  --role=roles/secretmanager.secretAccessor
gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:681909333795@cloudbuild.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
gcloud iam service-accounts list
gcloud services enable cloudbuild.googleapis.com
gcloud iam service-accounts create cloudbuild --display-name "Cloud Build Service Account"
gcloud iam service-accounts list
gcloud iam service-accounts delete cloudbuild@reverse-ip-51286.iam.gserviceaccount.com
gcloud iam service-accounts create 681909333795@cloudbuild.gserviceaccount.com --display-name "Cloud Build Service Account"
gcloud iam service-accounts create cloudbuild-sa --display-name "Cloud Build Service Account"
gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:<YOUR_PROJECT_ID>.cloudbuild@gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:<YOUR_PROJECT_ID>.cloudbuild@<YOUR_PROJECT_ID>.iam.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
.iam.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:reverse-ip-51286.cloudbuild@reverse-ip-51286.iam.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
gcloud iam service-accounts list
gcloud secrets add-iam-policy-binding my-docker-credentials     --member=serviceAccount:cloudbuild-sa@reverse-ip-51286.iam.gserviceaccount.com     --role=roles/secretmanager.secretAccessor
nano cloudbuild.yaml
ls -l cloudbuild.yaml
gcloud builds submit --config cloudbuild.yaml .
nano cloudbuild.yaml
gcloud builds submit --config cloudbuild.yaml
nano cloudbuild.yaml
gcloud builds submit --config cloudbuild.yaml
gcloud container clusters create my-cluster     --num-nodes=3     --zone=us-central1-a     --machine-type=e2-medium
gcloud services enable container.googleapis.com
gcloud container clusters create my-cluster     --num-nodes=3     --zone=us-central1-a     --machine-type=e2-medium
gcloud container clusters create my-cluster     --num-nodes=3     --zone=us-central1-a     --machine-type=e2-medium     --cluster-ipv4-cidr=10.0.0.0/14     --enable-ip-alias
gcloud container clusters create my-cluster     --num-nodes=3     --zone=us-central1-a     --machine-type=e2-medium     --disk-size=75
gcloud container clusters get-credentials my-cluster --zone us-central1-a
kubectl create deployment reverse-ip-app --image=gcr.io/reverse-ip-51286/my-image
kubectl expose deployment reverse-ip-app --type=LoadBalancer --port=8080 --target-port=8080
kubectl get pods
kubectl get services
git init
git add .
git commit -m "Initial commit"
git remote add origin https://github.com/guttikondasaiteja/reverse-ip
git push -u origin main
git config --global user.name "Saiteja"
git config --global user.email "guttikondasaiteja09@gmail.com"
git branch -m main
