import os, sys, tempfile
os.environ["DB_MODE"] = "mock"
os.environ["AUDIT_DB_PATH"] = os.path.join(tempfile.mkdtemp(), "audit.sqlite")
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))
