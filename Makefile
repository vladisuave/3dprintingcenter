# Makefile for converting Markdown to PDF using Docker and pandoc/extra

# Variables
DOCKER_IMAGE = pandoc/extra
INPUT_FILE = 3d-printing-center-curriculum.md
OUTPUT_FILE = 3d-printing-center-curriculum.pdf
DOCX_OUTPUT = 3d-printing-center-curriculum.docx
HTML_OUTPUT = 3d-printing-center-curriculum.html

# Slide files
SLIDES_DIR = slides
SLIDES_OUTPUT_DIR = slides/pdf
LESSON1_SLIDES = $(SLIDES_DIR)/lesson1-slides.md
LESSON2_SLIDES = $(SLIDES_DIR)/lesson2-slides.md
LESSON3_SLIDES = $(SLIDES_DIR)/lesson3-slides.md
LESSON4_SLIDES = $(SLIDES_DIR)/lesson4-slides.md
LESSON5_SLIDES = $(SLIDES_DIR)/lesson5-slides.md
LESSON6_SLIDES = $(SLIDES_DIR)/lesson6-slides.md

LESSON1_PDF = $(SLIDES_OUTPUT_DIR)/lesson1-slides.pdf
LESSON2_PDF = $(SLIDES_OUTPUT_DIR)/lesson2-slides.pdf
LESSON3_PDF = $(SLIDES_OUTPUT_DIR)/lesson3-slides.pdf
LESSON4_PDF = $(SLIDES_OUTPUT_DIR)/lesson4-slides.pdf
LESSON5_PDF = $(SLIDES_OUTPUT_DIR)/lesson5-slides.pdf
LESSON6_PDF = $(SLIDES_OUTPUT_DIR)/lesson6-slides.pdf

LESSON1_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson1-slides-handout.pdf
LESSON2_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson2-slides-handout.pdf
LESSON3_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson3-slides-handout.pdf
LESSON4_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson4-slides-handout.pdf
LESSON5_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson5-slides-handout.pdf
LESSON6_HANDOUT = $(SLIDES_OUTPUT_DIR)/lesson6-slides-handout.pdf

ALL_SLIDE_PDFS = $(LESSON1_PDF) $(LESSON2_PDF) $(LESSON3_PDF) $(LESSON4_PDF) $(LESSON5_PDF) $(LESSON6_PDF)
ALL_HANDOUT_PDFS = $(LESSON1_HANDOUT) $(LESSON2_HANDOUT) $(LESSON3_HANDOUT) $(LESSON4_HANDOUT) $(LESSON5_HANDOUT) $(LESSON6_HANDOUT)

# Docker run command base
DOCKER_RUN = docker run --platform linux/x86_64 --rm --volume "$(PWD):/data" --user $(shell id -u):$(shell id -g) $(DOCKER_IMAGE)

# Default target
.PHONY: all
all: all-formats

# Convert to PDF
.PHONY: pdf
pdf:
	$(DOCKER_RUN) $(INPUT_FILE) -o $(OUTPUT_FILE)
	@echo "PDF created: $(OUTPUT_FILE)"

# Convert to DOCX
.PHONY: docx
docx:
	$(DOCKER_RUN) $(INPUT_FILE) -o $(DOCX_OUTPUT) \
		--lua-filter pagebreak.lua
	@echo "DOCX created: $(DOCX_OUTPUT)"

# Convert to HTML
.PHONY: html
html:
	$(DOCKER_RUN) $(INPUT_FILE) -o $(HTML_OUTPUT) \
		--standalone \
		--css=style.css \
		--highlight-style=pygments
	@echo "HTML created: $(HTML_OUTPUT)"

# Convert slides to PDF
.PHONY: slides
slides: $(ALL_SLIDE_PDFS)
	@echo "All slide PDFs created successfully!"

# Create slides output directory
$(SLIDES_OUTPUT_DIR):
	mkdir -p $(SLIDES_OUTPUT_DIR)

# Individual slide targets
$(LESSON1_PDF): $(LESSON1_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON1_SLIDES) -t beamer --slide-level=1 -o $(LESSON1_PDF)
	@echo "Lesson 1 slides created: $(LESSON1_PDF)"

$(LESSON2_PDF): $(LESSON2_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON2_SLIDES) -t beamer --slide-level=1 -o $(LESSON2_PDF)
	@echo "Lesson 2 slides created: $(LESSON2_PDF)"

$(LESSON3_PDF): $(LESSON3_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON3_SLIDES) -t beamer --slide-level=1 -o $(LESSON3_PDF)
	@echo "Lesson 3 slides created: $(LESSON3_PDF)"

$(LESSON4_PDF): $(LESSON4_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON4_SLIDES) -t beamer --slide-level=1 -o $(LESSON4_PDF)
	@echo "Lesson 4 slides created: $(LESSON4_PDF)"

$(LESSON5_PDF): $(LESSON5_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON5_SLIDES) -t beamer --slide-level=1 -o $(LESSON5_PDF)
	@echo "Lesson 5 slides created: $(LESSON5_PDF)"

$(LESSON6_PDF): $(LESSON6_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON6_SLIDES) -t beamer --slide-level=1 -o $(LESSON6_PDF)
	@echo "Lesson 6 slides created: $(LESSON6_PDF)"

# Convert slides to handouts
.PHONY: handouts
handouts: $(ALL_HANDOUT_PDFS)
	@echo "All slide handouts created successfully!"

# Individual handout targets
$(LESSON1_HANDOUT): $(LESSON1_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON1_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON1_HANDOUT)
	@echo "Lesson 1 handout created: $(LESSON1_HANDOUT)"

$(LESSON2_HANDOUT): $(LESSON2_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON2_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON2_HANDOUT)
	@echo "Lesson 2 handout created: $(LESSON2_HANDOUT)"

$(LESSON3_HANDOUT): $(LESSON3_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON3_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON3_HANDOUT)
	@echo "Lesson 3 handout created: $(LESSON3_HANDOUT)"

$(LESSON4_HANDOUT): $(LESSON4_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON4_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON4_HANDOUT)
	@echo "Lesson 4 handout created: $(LESSON4_HANDOUT)"

$(LESSON5_HANDOUT): $(LESSON5_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON5_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON5_HANDOUT)
	@echo "Lesson 5 handout created: $(LESSON5_HANDOUT)"

$(LESSON6_HANDOUT): $(LESSON6_SLIDES) | $(SLIDES_OUTPUT_DIR)
	$(DOCKER_RUN) $(LESSON6_SLIDES) -t beamer --slide-level=1 -V handout -o $(LESSON6_HANDOUT)
	@echo "Lesson 6 handout created: $(LESSON6_HANDOUT)"

# Convert to all formats
.PHONY: all-formats
all-formats: pdf docx html slides
	@echo "All formats created successfully!"

# Clean output files
.PHONY: clean
clean:
	rm -f $(OUTPUT_FILE) $(DOCX_OUTPUT) $(HTML_OUTPUT)
	rm -rf $(SLIDES_OUTPUT_DIR)
	@echo "Output files cleaned"

# Show help
.PHONY: help
help:
	@echo "Available targets:"
	@echo "  all          - Convert to all formats (default)"
	@echo "  pdf          - Convert curriculum to PDF"
	@echo "  docx         - Convert curriculum to DOCX"
	@echo "  html         - Convert curriculum to HTML"
	@echo "  slides       - Convert all lesson slides to PDF"
	@echo "  handouts     - Convert all lesson slides to handout PDFs"
	@echo "  all-formats  - Convert to all formats including slides"
	@echo "  clean        - Remove output files"
	@echo "  help         - Show this help message"
	@echo ""
	@echo "Usage examples:"
	@echo "  make              - Create all formats including slides"
	@echo "  make pdf          - Create curriculum PDF only"
	@echo "  make slides       - Create all lesson slide PDFs"
	@echo "  make handouts     - Create all lesson handout PDFs"
	@echo "  make all-formats  - Create everything"
	@echo "  make clean        - Clean all output files"
