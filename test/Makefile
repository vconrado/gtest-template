# Variáveis que DEVEM ser alteradas --------------------------------------
SRCS       = mainTestAll.cpp FooTest.cpp
APP_SRCS   = Foo.cpp
# ------------------------------------------------------------------------

# Variáveis que PODEM ser alteradas --------------------------------------
PROGRAM_NAME = test
CXXFLAGS  = -Wall -I../include -I$(GTEST_DIR)/include -Winline -O3
LDFLAGS   = -lpthread
GTEST_DIR = /opt/gtest
BUILD_DIR  = build
APP_DIR    = ../src
# ------------------------------------------------------------------------

# Variáveis que NÃO PRECISAM ser alteradas--------------------------------
CXX       = g++
OBJS      = $(SRCS:%.cpp=$(BUILD_DIR)/%.o)
APP_DIR_ADP  = $(subst ../,,$(APP_DIR))
APP_SRCS_REL = $(APP_SRCS:%.cpp=$(APP_DIR_ADP)/%.cpp)
APP_OBJS  =  $(APP_SRCS_REL:%.cpp=$(BUILD_DIR)/%.o)
GTEST_OBJS= $(GTEST_DIR)/src/gtest-all.o 

PROGRAM = $(BUILD_DIR)/$(PROGRAM_NAME)

# ------------------------------------------------------------------------
.SUFFIXES: .cpp .o
.PHONY: all clean

$(BUILD_DIR)/$(APP_DIR_ADP)/%.o: $(APP_DIR)/%.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $(CXXFLAGS) $< -o $@


$(BUILD_DIR)/%.o :  %.cpp
	@mkdir -p $(dir $@)
	$(CXX) -c $(CXXFLAGS) $< -o $@

all: $(PROGRAM) 

run: all
	@./$(PROGRAM)

$(PROGRAM): $(OBJS) $(APP_OBJS)
	$(CXX) -o $(PROGRAM) $(OBJS) $(APP_OBJS) $(GTEST_OBJS) $(CXXFLAGS) $(LDFLAGS)

clean:
	@/bin/rm -rf $(BUILD_DIR) *~

