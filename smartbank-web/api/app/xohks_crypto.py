"""XÖHKS signing (cryptounit.pas SetSign / SignCheck over the CRYPTOMODELLib COM object TCryptoSession).

The Delphi build never calls it: every SetSign use in PrepareFile_Unit.pas is commented out (CreateFile :379-392 '<sign>' /
L-CHIN key check) and SignCheck has no caller. The interface is kept so a real signer can be plugged in later without
touching the file code:  XOHKS_SIGNER=none (default, Delphi behaviour: nothing is signed) | mock (deterministic test value).
A real implementation must reproduce SetSign's input encoding: every byte of the AnsiString except #13 followed by #0
(UTF-16LE without CR), result = the signature bytes as upper-case hex (IntToHex(b,2)); SignCheck reads 141 bytes of hex.
"""
from __future__ import annotations

import hashlib
import os


class Signer:
    enabled = False

    def sign(self, secret_key: str, base_key: str, data: bytes) -> str:          # SetSign
        raise NotImplementedError

    def check(self, secret_key: str, base_key: str, data: bytes, sign_hex: str) -> tuple[bool, str]:   # SignCheck
        raise NotImplementedError


def sign_input(data: bytes) -> bytes:
    """SetSign / SignCheck stream: byte, #0 for every byte <> 13."""
    return b"".join(bytes([b, 0]) for b in data if b != 13)


class NoSigner(Signer):
    def sign(self, secret_key, base_key, data):
        raise RuntimeError("XÖHKS signing is not configured (Delphi does not sign: SetSign calls are commented out)")

    def check(self, secret_key, base_key, data, sign_hex):
        raise RuntimeError("XÖHKS signing is not configured")


class MockSigner(Signer):
    enabled = True

    def sign(self, secret_key, base_key, data):
        return hashlib.sha256(sign_input(data)).hexdigest().upper()

    def check(self, secret_key, base_key, data, sign_hex):
        return self.sign(secret_key, base_key, data) == sign_hex.upper(), "MOCK"


def get_signer() -> Signer:
    return MockSigner() if os.getenv("XOHKS_SIGNER", "none").lower() == "mock" else NoSigner()
