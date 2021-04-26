#!/usr/bin/env python

import pandas as pd
import sys

dp = pd.read_csv(sys.stdin)

dp = dp.drop_duplicates(subset=['id'])


dp.to_csv(sys.stdout)


