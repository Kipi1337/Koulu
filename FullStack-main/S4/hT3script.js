document.getElementById('search-input').addEventListener('input', searchNames);

let currentIndex = -1;

function searchNames() {
  const searchInput = document.getElementById('search-input');
  const searchTerm = searchInput.value.toLowerCase();
  const searchResults = document.getElementById('search-results');

  // Clear previous results
  searchResults.innerHTML = '';

  // Fetch names from JSON file
  fetch('names.json')
    .then(response => response.json())
    .then(names => {
      const matchingNames = names.filter(name => name.toLowerCase().startsWith(searchTerm));

      matchingNames.forEach((name, index) => {
        const listItem = document.createElement('li');
        listItem.textContent = name;
        listItem.onclick = () => selectResult(index);
        searchResults.appendChild(listItem);
      });
    })
    .catch(error => console.error('Error fetching names:', error));
}

function selectResult(index) {
  const searchInput = document.getElementById('search-input');
  const searchResults = document.getElementById('search-results');

  searchInput.value = searchResults.children[index].textContent;
  clearResults();
}

function clearResults() {
  const searchResults = document.getElementById('search-results');
  searchResults.innerHTML = '';
}

document.addEventListener('keydown', handleKeyPress);

function handleKeyPress(event) {
  const searchResults = document.getElementById('search-results');
  const resultItems = searchResults.children;
  const resultsCount = resultItems.length;

  if (event.key === 'ArrowDown' && resultsCount > 0) {
    currentIndex = (currentIndex + 1) % resultsCount;
    updateResultsHighlight();
  } else if (event.key === 'ArrowUp' && resultsCount > 0) {
    currentIndex = (currentIndex - 1 + resultsCount) % resultsCount;
    updateResultsHighlight();
  } else if (event.key === 'Enter' && currentIndex !== -1) {
    selectResult(currentIndex);
  } else if (event.key === 'Escape') {
    clearResults();
  }
}

function updateResultsHighlight() {
  const searchResults = document.getElementById('search-results');
  const resultItems = searchResults.children;

  for (let i = 0; i < resultItems.length; i++) {
    resultItems[i].classList.remove('active');
  }

  if (currentIndex !== -1) {
    resultItems[currentIndex].classList.add('active');
  }
}
