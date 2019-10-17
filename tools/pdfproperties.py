import pathlib as pl
from PyPDF2 import PdfFileReader


def file_list(extension: list or str, directory: pl.Path):

    if isinstance(extension, str):
        extension = [extension]

    # extension = [pl.Path(e) for e in extension]

    filelist = []
    for type in extension:
        wildcardformat = '**/*.' + type
        filelist.extend(sorted(directory.glob(wildcardformat)))

    return sorted(filelist)

def get_pdf_dimensions(file: pl.Path):
f = PdfFileReader(open(str(file), 'rb'))
    dim = f.getPage(1).mediaBox
    return dim

if __name__ =='__main__':
    pdffolder = pl.Path('/media/nelson/warhol/books/')
    fl = file_list('pdf', pdffolder)
    for f in fl:
        print(get_pdf_dimensions(f))


