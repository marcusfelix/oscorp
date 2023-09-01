const dictionary = {
  "en": {
    "progress_string": "Progress",
  }
};

translate(String key) => dictionary['en']?[key] ?? key;