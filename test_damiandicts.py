import damiandicts
import unittest

class Test_Damiandicts(unittest.TestCase):
    def test_sort_list(self):
        result = damiandicts.sort_list()
        expected = [
            {'name':'damian', 'number':'0870673903'},
            {'name':'siobhan', 'number':'0876870880'},
            {'name':'gary', 'number':'0864072034'}
            ]
        self.assertTrue(result, expected)

if __name__ == '__main__':
    unittest.main()
