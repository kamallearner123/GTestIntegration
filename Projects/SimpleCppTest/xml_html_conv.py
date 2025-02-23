
# Function to convert xml file to html file
def xml_to_html(xml_file, html_file):
    import xml.etree.ElementTree as ET
    from xml.dom import minidom
    import os

    # Parse the xml file
    tree = ET.parse(xml_file)
    root = tree.getroot()

    # Create the html file
    with open(html_file, 'w') as f:
        f.write('<html>\n')
        f.write('<head>\n')
        f.write('<style>\n')
        f.write('table, th, td {\n')
        f.write('  border: 1px solid black;\n')
        f.write('  border-collapse: collapse;\n')
        f.write('}\n')
        f.write('th, td {\n')
        f.write('  padding: 5px;\n')
        f.write('  text-align: left;\n')
        f.write('}\n')
        f.write('th {\n')
        f.write('  background-color: #f2f2f2;\n')
        f.write('}\n')
        f.write('</style>\n')
        f.write('</head>\n')
        f.write('<body>\n')

        # Create a table to display the test results
        f.write('<table>\n')
        f.write('<tr>\n')
        f.write('<th>Test Name</th>\n')
        f.write('<th>Result</th>\n')
        f.write('<th>Message</th>\n')
        f.write('</tr>\n')

        # Iterate over the test cases
        for test_case in root.findall('.//TestCase'):
            test_name = test_case.get('name')
            test_result = test_case.get('result')
            test_message = test_case.get('message')

            f.write('<tr>\n')
            f.write('<td>' + test_name + '</td>\n')
            f.write('<td>' + test_result + '</td>\n')
            f.write('<td>' + test_message + '</td>\n')
            f.write('</tr>\n')

        f.write('</table>\n')
        f.write('</body>\n')
        f.write('</html>\n')

    # Beautify the html file
    xml = minidom.parseString(open(html_file).read())
    with open(html_file, 'w') as f:
        f.write(xml.toprettyxml(indent='  '))


# Accept command line arguments
if __name__ == '__main__':
    import sys

    if len(sys.argv) != 3:
        print('Usage: python sml+to+html.py <xml_file> <html_file>')
        sys.exit(1)

    xml_file = sys.argv[1]
    html_file = sys.argv[2]

    xml_to_html(xml_file, html_file)
