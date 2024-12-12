apiVersion: apps/v1
kind: Deployment
metadata:
  name: markdown-blog-fronted
  labels:
    app: markdown-blog-fronted
spec:
  replicas: 1
  selector:
    matchLabels:
      app: markdown-blog-fronted
  template:
    metadata:
      labels:
        app: markdown-blog-fronted
    spec:
      containers:
      - name: markdown-blog-fronted
        image: us-west2-docker.pkg.dev/GOOGLE_CLOUD_PROJECT/markdown-blog/markdown-blog-fronted:COMMIT_SHA
        ports:
        - containerPort: 5000
---
kind: Service
apiVersion: v1
metadata:
  name: markdown-blog-fronted-service
spec:
  selector:
    app: markdown-blog-fronted
  ports:
  - protocol: TCP
    port: 5000
    targetPort: 5000
  type: LoadBalancer
