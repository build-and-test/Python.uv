import unittest
import requests

class Tests(unittest.TestCase):
    def test_example(self):
        self.assertEqual(200, requests.codes.ok)
