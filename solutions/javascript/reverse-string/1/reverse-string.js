//
// This is only a SKELETON file for the 'Reverse String' exercise. It's been provided as a
// convenience to get you started writing code faster.
//

export const reverseString = (txt) => {
  let newText=""
  for (let i=txt.length-1;i>=0;i--)
    newText=newText.concat(txt.charAt(i))
  return newText
};
