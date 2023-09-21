matrixContainer = document.querySelector("#digital-rain-container");
			matrixContainer.classList.add("digital");
			
			const numberOfColumns = 50;

			for (let i = 0; i < numberOfColumns; i++) {
				const column = document.createElement("div");
				column.classList.add("digital-column");
				column.style.left = `${i * 20}px`;
				column.style.animationDuration = `${Math.random() * 6 + 3}s`;
				column.style.animationDelay = `${Math.random()}s`;
			
				const chars = 25;
				for (let j = 0; j < chars; j++) {
					const char = document.createElement("span");
					
					if (Math.random() < 0.5) {
						char.textContent = String.fromCharCode(48 + Math.floor(Math.random() * 10));
					} else {
						char.textContent = String.fromCharCode(33 + Math.floor(Math.random() * 94));
					}
					
					column.appendChild(char);
				}
			
				matrixContainer.appendChild(column);
			}