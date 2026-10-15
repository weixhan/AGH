"""Launch only the source-pinned scientific recovery MCP sidecar."""
import os
from pathlib import Path
import sys

ROOT = Path(__file__).resolve().parent
os.chdir(ROOT)
sys.path[0] = str(ROOT)
from defect_researcher.resolution_research_mcp_server_v1 import main


if __name__ == "__main__":
    raise SystemExit(main())
