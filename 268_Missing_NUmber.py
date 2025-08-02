class Solution(object):
    def missingNumber(self, nums):
        """
        :type nums: List[int]
        :rtype: int
        """
        minn = min(nums)
        maxx = max(nums)
        set1 = set(list(range(minn, maxx+1)))
        set2 = set(nums)
        df = set1 - set2
        if df:
            return df.pop()
        return None