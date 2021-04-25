#!/usr/bin/env python

import pandas as pd
import sys
import re

s_dp = pd.read_csv(sys.argv[1])
r_dp = pd.read_csv(sys.argv[2])

a_dp = pd.merge(s_dp,r_dp)
a_dp['time'] = pd.to_datetime(a_dp['time'],unit='s')
a_dp['a_time'] = pd.to_datetime(a_dp['a_time'],unit='s')

a_dp['att_type'] =  a_dp['att_type'].apply(lambda x: re.sub(r'StoryAttachment(.*)StyleRenderer','\\1', str(x)))


a_dp.to_csv(sys.stdout)


