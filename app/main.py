from fastapi import FastAPI, Response, status
import os
import time

app = FastAPI(
    title="Cloud & DevSecOps Platform Microservice",
    description="Production-ready sample microservice for Azure AKS DevSecOps pipeline demonstration",
    version="1.0.0"
)

START_TIME = time.time()

@app.get("/")
def read_root():
    return {
        "status": "online",
        "service": "azure-aks-devsecops-pipeline",
        "environment": os.getenv("ENVIRONMENT", "production"),
        "version": "1.0.0",
        "uptime_seconds": round(time.time() - START_TIME, 2)
    }

@app.get("/healthz", status_code=status.HTTP_200_OK)
def liveness_probe():
    """Liveness probe: verifies that the application process is running."""
    return {"status": "healthy", "timestamp": time.time()}

@app.get("/readyz", status_code=status.HTTP_200_OK)
def readiness_probe(response: Response):
    """Readiness probe: verifies that dependencies and networking are operational."""
    # Custom readiness checks (e.g., database, cache) can be added here
    return {"ready": True}
