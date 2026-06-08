# TMaskEdit Complete Examples - Lazarus

**Complete working example demonstrating all practical uses of TMaskEdit component in Lazarus/Free Pascal.**

## 📋 What's Included

This project contains ready-to-compile examples for:

### 1. **Phone Numbers** ☎️
- Landline format: `(00) 0000-0000`
- Mobile format: `99 (99) 9 9999-9999`

### 2. **Time Formats** ⏰
- Simple time: `00:00` (HH:MM)
- DateTime: `9999:99:99 99:99:99` (YYYY:MM:DD HH:MM:SS)

### 3. **Numeric Formats** 🔢
- Decimal: `0.00`
- Score: `99.9`
- Price: `\R\$ 0,00` (Brazilian currency)

### 4. **Addresses & Hexadecimal** 🌐
- IP Address: `099.099.099.099`
- MAC Address: `00:00:00:00:00:00`
- Hexadecimal: `>AA\ AA\ AA\ AA\ AA\ AA\ AA\ AA`

### 5. **Text Filtering** ✏️
- Names: `>L<llllllllllllllllllll` (First uppercase, rest lowercase)
- Email: `cccccccccccccccccccccccccccccc` (Any characters)
- Passport: `00 00` (Digits only)

---

## 🚀 Quick Start

### Option 1: Using Lazarus IDE (Easiest)

1. Open Lazarus
2. Go to `File > Open Project`
3. Select `MaskEditDemo.lpr`
4. Press `F9` or click `Run > Run`
5. Application will compile and run automatically

### Option 2: Command Line

```bash
# Navigate to project directory
cd /path/to/project

# Compile
lazbuild MaskEditDemo.lpr

# Run
./MaskEditDemo
```

### Option 3: Free Pascal Compiler

```bash
fpc MaskEditDemo.lpr
./MaskEditDemo
```

---

## 📁 File Structure

```
TMaskEdit-Lazarus-Examples/
├── MaskEditDemo.lpr        # Main project file (entry point)
├── MainForm.pas            # Form logic and TMaskEdit examples
├── MainForm.lfm            # Form visual design
└── README.md               # This file
```

---

## 🎯 EditMask Syntax Reference

| Code | Meaning |
|------|----------|
| `0` | Required digit |
| `9` | Optional digit |
| `#` | Optional digit, space, +, or - |
| `L` | Required letter (uppercase) |
| `l` | Optional letter (lowercase) |
| `A` | Required alphanumeric |
| `a` | Optional alphanumeric |
| `C` | Required any character |
| `c` | Optional any character |
| `>` | Convert following to uppercase |
| `<` | Convert following to lowercase |
| `\` | Escape next character (make it literal) |
| `:` | Time separator |
| `/` | Date separator |
| `!` | Trim leading blanks |
| `;` | Separator in mask definition |

---

## 🔧 Mask Format Specification

```pascal
EditMask := 'Pattern;SaveChars;BlankChar';
```

**Parameters:**
- **Pattern**: The format specification using mask codes
- **SaveChars**: `0` or `1` (whether to save literal characters in Text property)
- **BlankChar**: Character used for empty positions (default `_`)

### Examples

```pascal
// Phone: save literals, use underscore
edtPhone.EditMask := '(00) 0000-0000;1;_';

// Time: don't save literals, use zero
edtTime.EditMask := '00:00;0;0';

// IP Address: save literals
edtIP.EditMask := '099.099.099.099;1;_';

// Currency with symbol
edtPrice.EditMask := '\R\$ 0,00;1;_';

// Name with case conversion
edtName.EditMask := '>L<llllllllllllllll;0;_';
```

---

## 🔍 Properties & Methods

### Text Property
Returns the value **including** mask literal characters:
```pascal
edtPhone.Text;  // Returns: (21) 3333-4444
```

### EditText Property
Returns **only** the input data without mask literals:
```pascal
edtPhone.EditText;  // Returns: 2133334444
```

### IsMasked Property
Boolean property indicating if mask is active:
```pascal
if edtPhone.IsMasked then
  ShowMessage('Mask is active');
```

### ValidateEdit Method
Validates the entered text against the mask:
```pascal
if not edtPhone.IsMasked then
  edtPhone.ValidateEdit;
```

---

## 💡 Common Use Cases

### Phone Input
```pascal
edtPhone.EditMask := '(00) 0000-0000;1;_';
edtPhone.MaxLength := 14;
// User enters: (21) 3333-4444
// Text returns: (21) 3333-4444
// EditText returns: 2133334444
```

### Date/Time Input
```pascal
edtTime.EditMask := '00:00;1;_';
edtTime.MaxLength := 5;
// User enters: 14:30
// Text returns: 14:30
// EditText returns: 1430
```

### Numeric Input
```pascal
edtPrice.EditMask := '0.00;1;_';
edtPrice.MaxLength := 5;
// User enters: 99.99
// Text returns: 99.99
// EditText returns: 9999
```

### Email Input
```pascal
edtEmail.EditMask := 'cccccccccccccccccccccccccccccc;0;_';
edtEmail.MaxLength := 30;
// User can enter any characters
```

---

## 💻 Tips & Tricks

### 1. **Trim Leading Blanks**
Use `!` at the start to remove leading blanks:
```pascal
edtTime.EditMask := '!00:00;0;0';  // Trims leading zeros
```

### 2. **Case Conversion**
Combine `>` (uppercase) or `<` (lowercase) with letter codes:
```pascal
edtName.EditMask := '>L<llllllll;0;_';  // First uppercase, rest lowercase
```

### 3. **Escape Special Characters**
Use `\` before literals:
```pascal
edtPhone.EditMask := '\(00\) 9999-9999;1;_';  // Literal parentheses
edtPrice.EditMask := '\R\$ 0,00;1;_';          // Literal R$
```

### 4. **Get Clean Data for Database**
Always use `EditText` when saving:
```pascal
query.ParamByName('phone').AsString := edtPhone.EditText;  // Just digits
```

### 5. **Dynamic Mask Change**
You can change the mask at runtime:
```pascal
if typePhone = 1 then
  edtPhone.EditMask := '(00) 0000-0000;1;_'
else
  edtPhone.EditMask := '99 (99) 9 9999-9999;0;_';
```

### 6. **Optional vs Required Fields**
- **Required**: Use uppercase codes (`0`, `A`, `L`, `C`)
- **Optional**: Use lowercase codes (`9`, `a`, `l`, `c`)

```pascal
edtRequired.EditMask := '00:00;1;_';    // Both digits required
edtOptional.EditMask := '09:09;1;_';    // Both digits optional
```

---

## ✅ Testing the Examples

Each tab contains:
1. **Input fields** with different mask formats
2. **Test button** to display results
3. **Memo** showing:
   - Format description
   - Input values
   - Text property (with mask)
   - EditText property (without mask)
   - Mask properties
4. **Message box** with formatted results

---

## 🐛 Troubleshooting

### Compilation Issues

**Error: "Unit not found"**
- Ensure Lazarus is installed correctly
- Check LCL (Lazarus Component Library) is available

**Error: "Form not created"**
- Make sure both `MainForm.pas` and `MainForm.lfm` are in the same directory
- Check file permissions

### Runtime Issues

**Mask not working**
- Verify EditMask syntax is correct
- Check MaxLength matches mask length
- Ensure you're using TMaskEdit, not TEdit

**Text not showing**
- Set initial Text property after setting EditMask
- Use FormCreate event to initialize values

---

## 📚 More Resources

- [Free Pascal Documentation](https://www.freepascal.org/docs.html)
- [Lazarus Documentation](https://wiki.lazarus.freepascal.org/)
- [Mask Component Reference](https://wiki.lazarus.freepascal.org/Mask)

---

## 📄 License

Free to use for educational and commercial purposes.

---

## 🙋 Questions?

If you have questions about TMaskEdit or Lazarus:
1. Check the inline comments in the code
2. Hover over properties in IDE for tooltips
3. Press F1 in Lazarus to open help
4. Visit Lazarus forum: https://forum.lazarus.freepascal.org/

---

**Happy coding with Lazarus! 🚀**