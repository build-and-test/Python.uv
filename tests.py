import pathlib
import subprocess
import unittest
import requests

class Tests(unittest.TestCase):
    def test_example(self):
        # Uses an installed package, to ensure that the virtual environment is set up correctly
        self.assertEqual(200, requests.codes.ok)

    def test_uv_version(self):
        # Ensure that the UV version is pinned, not latest
        result = subprocess.run([".uv/bin/uv", "--version"], stdout=subprocess.PIPE, text=True, check=True)
        self.assertTrue(result.stdout.startswith("uv 0.5.13"))

    # for CI to ensure that the tests actually ran, and didn't just get skipped silently
    def test_uv_create_a_semaphore(self):
        pathlib.Path(__file__).parent.joinpath("semaphore").touch()
