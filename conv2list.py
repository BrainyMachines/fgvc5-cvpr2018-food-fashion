import ijson
import argparse
import sys


def conv2list(ifile, ofile):
    objs = ijson.items(ifile, 'images')
    for x in next(objs):
        ofile.write('%s %s\n' % (x['url'], x['imageId']))


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Extract image URLs from JSON and convert to list')
    parser.add_argument(
        '--input', '-i', type=argparse.FileType('r'), default=sys.stdin,
        metavar='PATH',
        help="Input JSON (default: standard input).")
    parser.add_argument(
        '--output', '-o', type=argparse.FileType('w'), default=sys.stdout,
        metavar='PATH',
        help="Output file (default: standard output)")
    args = parser.parse_args()
    conv2list(args.input, args.output)
