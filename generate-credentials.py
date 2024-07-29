#
# This script helps to extract the credentials 
# to hardcode into the probe experiment.
#
import sys
import json

def extract_lines_between_tags(filename, tag):

    start_tag = f"<{tag}>"
    end_tag = f"</{tag}>"

    with open(filename, 'r') as file:
        lines = file.readlines()

    captured = []
    inside = False

    for line in lines:
        if start_tag in line:
            inside = True
            line = line.split(start_tag, 1)[1]
        if inside:
            if end_tag in line:
                line = line.split(end_tag, 1)[0]
                inside = False
            captured.append(line.strip())

    return '\n'.join(captured[1:-1])


if __name__ == "__main__":

    fn = sys.argv[1]

    creds = {
        "ca": extract_lines_between_tags(fn, 'ca'),
        "cert": extract_lines_between_tags(fn, 'cert'),
        "key": extract_lines_between_tags(fn, 'key')
    }

    print(json.dumps(creds))

