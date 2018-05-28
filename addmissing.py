import argparse
import sys


def addmissing(ifile, ofile, N):
    with ifile:
        with ofile:
            S = set(range(1, N+1))
            for line in ifile:
                l = line.strip().split(',')
                if l[0] != 'image_id':
                    S.remove(int(l[0]))
                ofile.write(line)
            for s in S:
                ofile.write("%d,\n" % s)


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description='Add missing items to submission file')
    parser.add_argument(
        '--input', '-i', type=argparse.FileType('r'), default=sys.stdin,
        metavar='PATH',
        help="Input csv (default: standard input).")
    parser.add_argument(
        '--output', '-o', type=argparse.FileType('w'), default=sys.stdout,
        metavar='PATH',
        help="Output csv (default: standard output)")
    parser.add_argument('--range', '-r', type=int, default=39706,
        help="range of ids to be filled in (default: 39706)")
    args = parser.parse_args()
    addmissing(args.input, args.output, args.range)
