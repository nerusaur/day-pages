
const navToggle = document.querySelector(".nav-toggle");
const links = document.querySelector(".links");
const entryForm = document.getElementById('entryForm');
  const entryResultRow = document.querySelector('.history');
  const getEntryTitle = document.getElementById('entry-title');
  const getEntryText = document.getElementById('entry');
  const moodSelector = document.getElementById('mood-selector');
  const moodPercentageDisplay = document.getElementById('mood-percentage');
  const imageUpload = document.getElementById('image-upload');
  const previewImage = document.getElementById('preview-image');
  const imageContainer = document.getElementById('image-container');
  
navToggle.addEventListener("click", function () {
  links.classList.toggle("show");
});





document.addEventListener('DOMContentLoaded', function () {
 

  // Handle image upload and preview
  imageUpload.addEventListener('change', function () {
    const file = this.files[0];
    if (file) {
      const reader = new FileReader();
      reader.onload = function (e) {
        uploadedImageSrc = e.target.result; // Ensure this updates correctly
        console.log("Image uploaded:", uploadedImageSrc); // Debugging
        previewImage.src = uploadedImageSrc;
        imageContainer.style.display = 'block';
      };
      reader.readAsDataURL(file);
    }
  });
  
  function saveToDatabase(entryTitle, dateString, imageHTML, escapedEntryText) {
    const moodSelector = document.getElementById('mood-selector');
    const mood = moodSelector.options[moodSelector.selectedIndex]?.value || '';

    if (!entryTitle || !dateString || !escapedEntryText || !mood) {
        alert('Please fill out all required fields.');
        return;
    }

    const data = {
        entryTitle,
        dateString,
        imageHTML,
        escapedEntryText,
        mood,
    };

    console.log('Sending data to save_entry.php:', data);

    fetch('save_entry.php', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data),
    })
        .then((response) => {
            if (!response.ok) {
                throw new Error(`HTTP error! status: ${response.status}`);
            }
            return response.json();
        })
        .then((result) => {
            if (result.success) {
                alert('Entry saved successfully!');
                console.log('Server response:', result);
            } else {
                alert('Error saving entry: ' + result.error);
                console.error('Server error:', result.error);
            }
        })
        .catch((error) => {
            console.error('Error:', error);
            alert('Failed to save the entry. Check console for details.');
        });
}

document.addEventListener('DOMContentLoaded', function () {
  const entryResultRow = document.querySelector('.history');

});

// Fetch all entries on page load
document.addEventListener('DOMContentLoaded', fetchEntries);



// Function to fetch entries based on mood filter
function fetchEntries(mood = '') {
  // Define the base URL of the PHP script
  let url = 'fetch_entries.php'; // Adjust the path as necessary

  // Add mood parameter if a mood is selected
  if (mood && mood !== 'None') {
    url += `?mood=${encodeURIComponent(mood)}`;
  }

  // Make the fetch request
  fetch(url, {
    method: 'GET',
    headers: {
      'Content-Type': 'application/json',
    },
  })
    .then((response) => response.json()) // Parse the JSON response
    .then((data) => {
      if (data.success) {
        // Successfully fetched entries
        displayEntries(data.entries);
      } else {
        // Handle errors
        console.error('Error:', data.error);
        alert(data.error);
      }
    })
    .catch((error) => {
      // Handle fetch errors
      console.error('Fetch Error:', error);
    });
}

// Add event listener for mood dropdown
document.getElementById('mood-selector-filter').addEventListener('change', function () {
  const selectedFilter = this.value;
  let url = 'fetch_entries.php';
  if (selectedFilter === 'None') {
    // Default to descending order when no filter is selected
    url += `?sort=DateDesc`;
  } else if (selectedFilter === 'DateAsc' || selectedFilter === 'DateDesc') {
    // For explicitly selected date sorting
    url += `?sort=${selectedFilter}`;
  } else {
    // For other filters (e.g., mood)
    url += `?mood=${selectedFilter}`;
  }
  
  fetchEntries(url);
});

// Updated fetchEntries function to accept a URL
function fetchEntries(url) {
  fetch(url, { method: 'GET' })
    .then((response) => response.json())
    .then((data) => {
      if (data.success) {
        displayEntries(data.entries);
      } else {
        alert(data.error);
      }
    })
    .catch((error) => console.error('Fetch Error:', error));
}

// Initial call to load all entries by default
fetchEntries('fetch_entries.php');


function displayEntries(entries) {
  const historyContainer = document.querySelector('.history'); // Select the history container
  historyContainer.innerHTML = ''; // Clear existing entries

  if (entries.length === 0) { // Check if no entries are returned after filtering
    const noEntriesMessage = document.createElement('p');
    noEntriesMessage.textContent = 'No entries found for the selected filter.';
    noEntriesMessage.style.textAlign = 'center';
    noEntriesMessage.style.fontSize = '1.2em';
    noEntriesMessage.style.marginTop = '20px';
    historyContainer.appendChild(noEntriesMessage); // Display message in container
    return;
  }

  entries.forEach((entry) => {
    const { id, entry_title, date_string, image_html, entry_text, gratitude } = entry;

    // Create entry container
    const entryBox = document.createElement('div');
    entryBox.className = 'entry-box-container';
    entryBox.style.cursor = 'pointer';
    entryBox.style.border = '1px solid #ccc';
    entryBox.style.borderRadius = '5px';
    entryBox.style.padding = '10px';
    entryBox.style.margin = '10px auto';
    entryBox.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.1)';
    entryBox.style.transition = 'transform 0.3s ease';
    entryBox.style.position = 'relative';

    // Show/Hide buttons on hover
    entryBox.addEventListener('mouseenter', () => {
        deleteButton.style.display = 'block';
        showMoreButton.style.display = 'block';
    });
    entryBox.addEventListener('mouseleave', () => {
        deleteButton.style.display = 'none';
        showMoreButton.style.display = 'none';
    });

    // Title
    const entryHeading = document.createElement('h3');
    entryHeading.textContent = entry_title;
    entryBox.appendChild(entryHeading);

    // Date
    const entryDate = document.createElement('p');
    entryDate.textContent = `Date Added: ${date_string}`;
    entryDate.style.fontStyle = 'italic';
    entryBox.appendChild(entryDate);

    // Content preview
    const entryContent = document.createElement('p');
    entryContent.textContent = entry_text.length > 100 ? entry_text.substring(0, 100) + '...' : entry_text;
    entryBox.appendChild(entryContent);

    // Image
    if (image_html) {
        const entryImage = document.createElement('img');
        entryImage.src = image_html;
        entryImage.style.width = '100%';
        entryImage.style.maxHeight = '150px';
        entryImage.style.objectFit = 'cover';
        entryBox.appendChild(entryImage);
    }

    // "Show More" button
    const showMoreButton = document.createElement('button');
    showMoreButton.textContent = 'Show More';
    showMoreButton.style.display = 'none'; // Hidden by default
    showMoreButton.style.position = 'absolute';
    showMoreButton.style.bottom = '10px';
    showMoreButton.style.left = '10px';
    showMoreButton.style.backgroundColor = '#007BFF';
    showMoreButton.style.color = 'white';
    showMoreButton.style.border = 'none';
    showMoreButton.style.padding = '8px 12px';
    showMoreButton.style.borderRadius = '5px';
    showMoreButton.style.cursor = 'pointer';

    // Create and style the tooltip
const tooltip = document.createElement('div');
tooltip.className = 'tooltip';
tooltip.style.position = 'absolute';
tooltip.style.backgroundColor = '#333';
tooltip.style.color = '#fff';
tooltip.style.padding = '5px 10px';
tooltip.style.borderRadius = '5px';
tooltip.style.fontSize = '0.9em';
tooltip.style.boxShadow = '0 2px 5px rgba(0, 0, 0, 0.2)';
tooltip.style.display = 'none';
tooltip.style.zIndex = '10';

// Add the tooltip to the document body
document.body.appendChild(tooltip);

// Assuming `entryBox` is your diary entry element
entryBox.addEventListener('mouseenter', () => {
  entryBox.style.transform = 'scale(1.03)';
  tooltip.textContent = `Gratitude: ${gratitude}`; // Replace `gratitude` with the actual data
  tooltip.style.display = 'block';
});

entryBox.addEventListener('mouseleave', () => {
  entryBox.style.transform = 'scale(1)';
  tooltip.style.display = 'none';
});

entryBox.addEventListener('mousemove', (event) => {
  tooltip.style.left = `${event.pageX + 10}px`;
  tooltip.style.top = `${event.pageY + 10}px`;
});

    showMoreButton.addEventListener('click', () => {
      const newTab = window.open('', '_blank');
      if (newTab) {
          const escapedEntryText = JSON.stringify(entry_text); // Escape the entry text
          const imageHTML = image_html 
              ? `<img src="${image_html}" alt="Entry Image">` 
              : ''; // Check if image exists
  
          newTab.document.write(`
            <!DOCTYPE html>
            <html lang="en">
            <head>
              <meta charset="UTF-8">
              <meta name="viewport" content="width=device-width, initial-scale=1.0">
              <title>${entry_title}</title>
              <style>
                body {
                  font-family: 'Georgia', serif;
                  margin: 0;
                  padding: 0;
                  background-color: #fefcf3;
                  color: #4a4a4a;
                  line-height: 1.6;
                }
                .diary {
                  max-width: 700px;
                  margin: 30px auto;
                  padding: 20px;
                  background: #fff;
                  border: 1px solid #ececec;
                  border-radius: 8px;
                  box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
                }
                h1 {
                  font-family: 'Lucida Handwriting', cursive;
                  font-size: 2em;
                  text-align: center;
                  margin-bottom: 10px;
                  color: #333;
                }
                .date {
                  font-size: 0.9em;
                  text-align: right;
                  color: #666;
                  margin-bottom: 20px;
                }
                img {
                  display: block;
                  max-width: 100%;
                  height: auto;
                  margin: 20px auto;
                  border: 2px solid #ddd;
                  border-radius: 5px;
                  box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
                }
                .entry-text {
                  font-size: 1.1em;
                  text-indent: 2em;
                  text-align: justify;
                  margin-top: 10px;
                  white-space: pre-wrap;
                }
                .footer {
                  text-align: center;
                  margin-top: 20px;
                  font-size: 0.9em;
                  color: #999;
                }
              </style>
            </head>
            <body>
              <div class="diary">
                <h1>${entry_title}</h1>
                <p class="date"><em>${date_string}</em></p>
                ${imageHTML}
                <p class="entry-text" id="entryText"></p>
                <p> I am thankful for: ${gratitude}</p>
                <div class="footer">
                  <p>“A moment in time, forever etched in words.”</p>
                </div>
              </div>
              <script>
                const text = ${escapedEntryText};
                const entryTextElement = document.getElementById('entryText');
                let i = 0;
                function typeWriter() {
                  if (i < text.length) {
                    entryTextElement.textContent += text.charAt(i);
                    i++;
                    setTimeout(typeWriter, 15);
                  }
                }
                typeWriter();
              </script>
            </body>
            </html>
          `);
          newTab.document.close();
      }
  });
    entryBox.appendChild(showMoreButton);

    // Delete button
    const deleteButton = document.createElement('button');
    deleteButton.textContent = 'Delete';
    deleteButton.style.display = 'none'; // Hidden by default
    deleteButton.style.position = 'absolute';
    deleteButton.style.bottom = '10px';
    deleteButton.style.right = '10px';
    deleteButton.style.backgroundColor = '#FF4D4D';
    deleteButton.style.color = 'white';
    deleteButton.style.border = 'none';
    deleteButton.style.padding = '8px 12px';
    deleteButton.style.borderRadius = '5px';
    deleteButton.style.cursor = 'pointer';

    deleteButton.addEventListener('click', async (event) => {
        event.stopPropagation();
        if (confirm('Are you sure you want to delete this entry?')) {
            try {
                const response = await fetch('delete-entry.php', {
                    method: 'DELETE',
                    headers: {
                        'Content-Type': 'application/x-www-form-urlencoded',
                    },
                    body: `id=${id}`, // Pass the entry ID
                });

                if (!response.ok) {
                    throw new Error('Failed to delete the entry');
                }

                const result = await response.json();
                if (result.success) {
                    alert('Entry deleted successfully!');
                    entryBox.remove();
                } else {
                    alert(`Error: ${result.error}`);
                }
            } catch (error) {
                alert(`Error deleting entry: ${error.message}`);
            }
        }
    });

    entryBox.appendChild(deleteButton);

    historyContainer.appendChild(entryBox);
});

}


// Fetch entries on page load
document.addEventListener('DOMContentLoaded', fetchEntries);

document.addEventListener('DOMContentLoaded', function() {
  const moodDropdown = document.getElementById('mood-selector-filter');

  // Fetch moods from the server
  fetch('get_moods.php')
      .then(response => response.json())
      .then(moods => {
          // Add each fetched mood as an option in the dropdown
          moods.forEach(mood => {
              const option = document.createElement('option');
              option.value = mood;
              option.textContent = `${mood} ${getMoodEmoji(mood)}`;
              moodDropdown.appendChild(option);
          });

          // Add static options at the end
          addStaticOptions();
      })
      .catch(error => console.error('Error fetching moods:', error));

  // Function to append static options
  function addStaticOptions() {
      const staticOptions = [
          { value: 'Date', text: 'By Date' },
          { value: 'None', text: 'None' }
      ];

      staticOptions.forEach(item => {
          const option = document.createElement('option');
          option.value = item.value;
          option.textContent = item.text;
          moodDropdown.appendChild(option);
      });
  }

});

});
let moodChart;

// Function to fetch mood data
function fetchMoodData(period) {
  console.log(`Fetching data for period: ${period}`); // Debugging log

  fetch(`fetch_mood_data.php?period=${period}`)
    .then((response) => {
      if (!response.ok) {
        throw new Error(`Network response was not ok: ${response.statusText}`);
      }
      return response.json();
    })
    .then((data) => {
      console.log('Data received:', data);

      if (data.success) {
        const moodData = data.moodData;

        // Check if moodData is empty
        if (!moodData || Object.keys(moodData).length === 0) {
          console.warn('No data available for the selected period.');
          document.getElementById('mood-percentage').innerHTML = 'No data available.';
          updateMoodChart([], []);
          return;
        }

        // Extract labels and values for the chart
        const labels = Object.keys(moodData);
        const values = Object.values(moodData);

        // Calculate percentages
        const totalEntries = values.reduce((sum, value) => sum + value, 0);
        const moodPercentage = values.map((count) => ((count / totalEntries) * 100).toFixed(2));

        // Display mood percentages below the chart
        document.getElementById('mood-percentage').innerHTML =
          labels.map((label, index) => `${label}: ${moodPercentage[index]}%`).join('<br>');

        // Find the most frequent mood
        const maxMoodCount = Math.max(...values);
        const mostFrequentMood = labels[values.indexOf(maxMoodCount)];

        // Display a message based on the most frequent mood
        displayMoodMessage(mostFrequentMood);

        // Update the chart with new data
        updateMoodChart(labels, values);
      } else {
        console.error('Error from API:', data.error);
        document.getElementById('mood-percentage').innerHTML = `Error: ${data.error}`;
      }
    })
    .catch((error) => {
      console.error('Fetch Error:', error);
      document.getElementById('mood-percentage').innerHTML = 'An unexpected error occurred.';
    });
}

// Function to update the chart
function updateMoodChart(labels, values) {
  const ctx = document.getElementById('moodChart').getContext('2d');

  // Destroy existing chart if it exists
  if (moodChart) {
    moodChart.destroy();
  }

  // Create a new chart
  moodChart = new Chart(ctx, {
    type: 'pie',
    data: {
      labels: labels,
      datasets: [{
        label: 'Mood Frequency',
        data: values,
        backgroundColor: [
          'rgba(75, 192, 192, 0.6)',
          'rgba(255, 99, 132, 0.6)',
          'rgba(255, 205, 86, 0.6)',
          'rgba(54, 162, 235, 0.6)',
          'rgba(153, 102, 255, 0.6)',
        ],
        borderColor: [
          'rgba(75, 192, 192, 1)',
          'rgba(255, 99, 132, 1)',
          'rgba(255, 205, 86, 1)',
          'rgba(54, 162, 235, 1)',
          'rgba(153, 102, 255, 1)',
        ],
        borderWidth: 1,
      }]
    },
    options: {
      responsive: true,
      maintainAspectRatio: true,
      plugins: {
        legend: {
          display: true,
          position: 'top',
        }
      },
      scales: {
        y: {
          beginAtZero: true,
          title: {
            display: true,
            text: 'Frequency',
            color: '#666',
            font: {
              size: 14
            }
          }
        },
        x: {
          title: {
            display: true,
            text: 'Mood',
            color: '#666',
            font: {
              size: 14
            }
          }
        }
      }
    }
  });
}

// Function to display message based on the most frequent mood
function displayMoodMessage(mostFrequentMood) {
  let message = '';

  switch (mostFrequentMood.toLowerCase()) {
    case 'happy':
      message = 'You are feeling great! Keep it up!';
      break;
    case 'sad':
      message = 'It seems like you are feeling down. It might help to talk to someone.';
      break;
    case 'angry':
      message = 'You seem upset. Try to find some time to relax and unwind.';
      break;
    case 'neutral':
      message = 'You are feeling neutral. A balanced mood can help you stay productive!';
      break;
    default:
      message = 'You are experiencing a variety of moods. Take it one step at a time!';
  }

  document.getElementById('mood-percentage').innerHTML += `<br><br><strong>Most Frequent Mood: ${mostFrequentMood}</strong><br>${message}`;
}

// Fetch "All Time" data on page load
document.addEventListener('DOMContentLoaded', () => {
  fetchMoodData('all');
});


