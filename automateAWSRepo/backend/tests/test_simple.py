import unittest

class TestSimple(unittest.TestCase):
    def test_always_true(self):
        self.assertTrue(True)

if __name__ == "__main__":
    unittest.main()
