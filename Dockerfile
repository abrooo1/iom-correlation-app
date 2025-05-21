# Use official Python image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy app code
COPY streamlit_app.py .

# Create data folder and copy private files
RUN mkdir -p /app/data
COPY data/data.xlsx /app/data/data.xlsx
COPY data/iom_logo.svg /app/data/iom_logo.svg

# Expose port and run the app
EXPOSE 8501
CMD ["streamlit", "run", "streamlit_app.py", "--server.address", "0.0.0.0"]