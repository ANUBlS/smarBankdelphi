"""Runtime configuration. Everything comes from environment variables / .env.

Delphi equivalent: local SmartBank.ini [DefaultConnection] (Username, Password,
ServiceName, AutoLogOn, ProductName) read in Programs/SmartBank/sbMainForm_Unit.pas:408-412
and :481. Passwords are never stored server-side in the web version.
"""
import os
from dataclasses import dataclass, field

try:
    from dotenv import load_dotenv
    load_dotenv()
except ImportError:  # pragma: no cover
    pass


def _b(name: str, default: bool) -> bool:
    return os.getenv(name, str(default)).strip().lower() in ("1", "true", "yes", "on")


@dataclass
class Settings:
    db_mode: str = os.getenv("DB_MODE", "mock").lower()          # mock | oracle
    oracle_host: str = os.getenv("ORACLE_HOST", "localhost")
    oracle_port: int = int(os.getenv("ORACLE_PORT", "1521"))
    oracle_service: str = os.getenv("ORACLE_SERVICE", "SB-CURRENT")  # Delphi default 'SB-CURRENT' (sbMainForm_Unit.pas:412)
    product_name: str = os.getenv("PRODUCT_NAME", "SmartBank")
    # Name of the DB-stored INI (Delphi: GetParam('SystemIniSourceLocation','ora:SmartBankIni'), sbMainForm_Unit.pas:396)
    system_ini_name: str = os.getenv("SYSTEM_INI_NAME", "SmartBankIni")
    tree_ini_section: str = os.getenv("TREE_INI_SECTION", "Tree")             # sbMainForm_Unit.dfm TV.IniSection
    plugin_ini_section: str = os.getenv("PLUGIN_INI_SECTION", "PluginManager")  # sbMainForm_Unit.dfm TV.PluginIniSection
    hide_denied_nodes: bool = _b("HIDE_DENIED_NODES", False)
    max_logon_retry: int = int(os.getenv("MAX_LOGON_RETRY", "3"))             # SBOInitPkg.pas:40
    login_lock_seconds: int = int(os.getenv("LOGIN_LOCK_SECONDS", "300"))
    session_idle_minutes: int = int(os.getenv("SESSION_IDLE_MINUTES", "45"))
    cookie_secure: bool = _b("COOKIE_SECURE", False)
    mock_fixtures: str = os.getenv("MOCK_FIXTURES", os.path.join(os.path.dirname(__file__), "..", "fixtures"))

    def dsn(self) -> str:
        """Exactly one database per deployment (login page asks only username + password)."""
        return os.getenv("ORACLE_DSN") or f"{self.oracle_host}:{self.oracle_port}/{self.oracle_service}"


settings = Settings()
