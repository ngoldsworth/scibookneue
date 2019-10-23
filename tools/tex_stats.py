'''
Python file with tools for finding the incidence of tex-submissions as compated to total number of submissions, in each subcategory of the arXiv.

Overall incidence: 93.3%
'''

import re
import numpy as np
import matplotlib.pyplot as plt

f = open('./raw_data.txt').readlines()

tex_total = 0
grand_total = 0
subcats = []
allmatches = []
for ln in f:
    dat = re.match('\|\s?([\w-]*\.[\w-]*)\s+\|\s?(\w+)\s+\|\s+(\d+)\s|', ln)
    allmatches.append(dat)
    grand_total += int(dat.group(3))
    if dat.group(2) == 'pdftex' or dat.group(2) == 'tex':
        tex_total += int(dat.group(3))
    subcats.append(dat.group(1))

subcats = list(set(subcats))

print(tex_total/grand_total)

by_subcat_percentages = []
by_subcats_subcats = []

for subcat in subcats:
    subcat_total = 0
    subcat_tex_total = 0
    for datum in allmatches:
        if datum.group(1) == subcat:
            subcat_total += int(datum.group(3))
            if datum.group(2) == 'pdftex' or datum.group(2) == 'tex':
                subcat_tex_total += int(datum.group(3))

    ratio = subcat_tex_total/subcat_total
    by_subcat_percentages.append(ratio)
    by_subcats_subcats.append(subcat)

categories = []
for j in allmatches:
    subcat = j.group(1)
    cat = re.match('^([\w-]+)\.', subcat).group(1)
    if cat not in categories:
        categories.append(cat)


by_cat_ratios = []
by_cat_cat = []
for cat in sorted(categories):
    cat_total = 0
    cat_tex_total = 0
    for datum in allmatches:
        print(datum.group(1))
        if re.match('([\w\-]+)\.', datum.group(1)).group(1) == cat:
            cat_total += int(datum.group(3))
            if datum.group(2) == 'pdftex' or datum.group(2) == 'tex':
                cat_tex_total += int(datum.group(3))

    if cat_total != 0:
        by_cat_ratios.append(cat_tex_total/cat_total)
        by_cat_cat.append(cat)


labels = np.array(by_cat_cat)
ratios = np.array(by_cat_ratios)

ypos = np.arange(len(labels))

plt.barh(ypos, ratios, align='center')
plt.yticks(ypos, labels)
plt.xlabel('Percent of category using LaTeX')
plt.show()
