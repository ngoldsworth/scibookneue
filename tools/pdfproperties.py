import pathlib as pl
import re
import subprocess
from PyPDF2 import PdfFileReader


def file_list(extension: list or str, directory: pl.Path):

    if isinstance(extension, str):
        extension = [extension]

    # extension = [pl.Path(e) for e in extension]

    filelist = []
    for ftype in extension:
        wildcardformat = '**/*.' + ftype
        filelist.extend(sorted(directory.glob(wildcardformat)))

    return sorted(filelist)


def get_pdf_dimensions(file: pl.Path):
    result = subprocess.run(['pdfinfo', str(file)], stdout=subprocess.PIPE).stdout.decode('utf-8')
    matches = re.search(r'Page size:\s+([\d\.]+)\sx\s([\d\.]+)', result)
    if not isinstance(matches, type(None)):
        return float(matches.group(1)), float(matches.group(2))
    else:
        return None


if __name__ =='__main__':
    import numpy as np
    import matplotlib.pyplot as plt
    pdffolder = pl.Path('/media/nelson/warhol/books/')
    fl = file_list('pdf', pdffolder)
    outof = len(fl)
    tupslist = []
    count = 0
    for f in fl:
        dim = get_pdf_dimensions(f)
        count += 1
        if dim != None:
            tupslist.append(dim)

        if count % 20 == 0:
            print(fl.index(f)/outof)

    sizes = np.asarray(tupslist)
    plt.scatter(sizes[1:], sizes[0:])
    plt.show()


