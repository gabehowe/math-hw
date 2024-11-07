import os
import re

if __name__ == '__main__':
    files = os.listdir('./')
    for i in files:
        if i.endswith('.msnippets'):
            with open(i) as file:
                data = file.read()
                replaced = re.sub(r"((?<!end)msnippet .+\n)(.+)\nendsnippet",
                                  r'context "math()"\n\1\2\nendsnippet\n\1$\2$\nendsnippet',
                                  data)
                replaced = replaced.replace('msnippet', 'snippet')
                snippet_file = i.replace('.msnippets', '.snippets')
                if os.path.exists(snippet_file):
                    os.remove(snippet_file)
                with open(snippet_file, "x+") as newfile:
                    newfile.write(replaced)
