# Variáveis que DEVEM ser alteradas --------------------------------------
SRCS      = src/Foo.cpp src/main.cpp
# ------------------------------------------------------------------------

# Variáveis que PODEM ser alteradas --------------------------------------
PROGRAM_NAME   = app
BUILD_DIR = build
CXXFLAGS  = -Wall -I./include -Winline -O3
LDFLAGS   = 
# ------------------------------------------------------------------------

# Variáveis que NÃO PRECISAM ser alteradas--------------------------------
CXX       = g++
OBJS      = $(SRCS:%.cpp=$(BUILD_DIR)/%.o)
TEST_DIR  = ./test
PROGRAM = $(BUILD_DIR)/$(PROGRAM_NAME)
# ------------------------------------------------------------------------

.SUFFIXES: .cpp .o
.PHONY: all test clean


$(BUILD_DIR)/%.o: %.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $(CXXFLAGS) $< -o $@

all: $(PROGRAM) 

run: all
	@./$(PROGRAM)

test:
	make -C $(TEST_DIR) run

$(PROGRAM): $(OBJS)
	$(CXX) -o $(PROGRAM) $(SRCS) $(CXXFLAGS) $(LDFLAGS)

clean:
	@/bin/rm -rf $(BUILD_DIR) *~ include/*~
	@make -C $(TEST_DIR) clean


