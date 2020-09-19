const code: {[key: string]: string} = {
  ' ': '11',
  'e': '101',
  't': '1001',
  'o': '10001',
  'n': '10000',
  'a': '011',
  's': '0101',
  'i': '01001',
  'r': '01000',
  'h': '0011',
  'd': '00101',
  'l': '001001',
  '!': '001000',
  'u': '00011',
  'c': '000101',
  'f': '000100',
  'm': '000011',
  'p': '0000101',
  'g': '0000100',
  'w': '0000011',
  'b': '0000010',
  'y': '0000001',
  'v': '00000001',
  'j': '000000001',
  'k': '0000000001',
  'x': '00000000001',
  'q': '000000000001',
  'z': '000000000000',
};

function encodeString(inputData: string): number {
  const char = inputData.split('');
  const encoded = new Map();

  char.forEach((letter: string, index) => {
    encoded.set(index, code[letter]);
    return 'Binary String';
  });

  const encodedSplited =
    Array.from(encoded.values()) || [].join('').match(/.{1,8}/g);
  const final = new Map();
  const hexChar = new Map();
  encodedSplited.forEach((hexLetter: string, index: number): number => {
    const byte = 8;
    const bin = 2;
    const hex = 16;
    if (hexLetter.length < byte) {
      hexChar.set(index, hexLetter.concat('0'.repeat(byte - hexLetter.length)));
    } else {
      hexChar.set(index, hexLetter);
    }

    const hexStr = parseInt(hexChar.get(index), bin).toString(hex);
    if (hexStr.length < 2) {
      const hexStrNew = '0'.concat(hexStr);
      final.set(index, hexStrNew);
    } else {
      final.set(index, hexStr);
    }

    return 0;
  });

  process.stdout.write(`${Array.from(final.values()).join(' ')}`);
  process.stdout.write('\n');
  return 0;
}

function main(): number {
  process.stdin.setEncoding('utf8');
  process.stdin.on('readable', () => {
    const inputData = process.stdin.read();
    if (inputData !== null) {
      encodeString(inputData);
    }
    return 'Data Loaded';
  });
  return 0;
}

main();
