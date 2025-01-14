# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: wismith <wismith@42ABUDHABI.AE>            +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/03/03 19:47:17 by wismith           #+#    #+#              #
#    Updated: 2022/05/10 18:02:46 by wismith          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = push_swap

.SILENT:

SRCS = push_swap parser/parser\
		err/err op/swap op/push op/rota\
		op/rotb algo/sort tools/finder\
		tools/ft_atoi_mod tools/finder2\
		algo/sort_ghost tools/finder3\
		algo/remainder err/err2 algo/big_algo\

OBJ_DIR = assets/Objects
OBJ = $(addprefix $(OBJ_DIR)/, $(addsuffix .o, $(SRCS)))
CC = gcc
CFLAGS = -Wall -Werror -Wextra
LIBFT = assets/libft
LIBFTARCH = assets/libft/Library/libft.a

$(OBJ_DIR)/%.o: srcs/%.c
	mkdir -p $(OBJ_DIR)
	mkdir -p $(OBJ_DIR)/parser
	mkdir -p $(OBJ_DIR)/err
	mkdir -p $(OBJ_DIR)/op
	mkdir -p $(OBJ_DIR)/algo
	mkdir -p $(OBJ_DIR)/tools
	$(CC) $(CFLAGS) -c $< -o $@

all: $(NAME)
	tput setaf 3
	echo "\n->" | tr -d '\n'
	tput setaf 2; echo " all provided " | tr -d '\n'
	tput setaf 3; echo "<-\n"
	tput setaf 7; echo "PUSH_SWAP: 'You may now run the executable'\n"

$(NAME): $(OBJ)
	tput setaf 7; echo "PUSH_SWAP: 'Building Libft may require a moment'\n"
	make -C $(LIBFT)
	@tput setaf 3; echo "\nASSETS->"
	@tput setaf 3; echo "Building->"
	$(CC) $(CFLAGS) $(OBJ) $(LIBFTARCH) -o $(NAME)
	rm -rf Objects

clean:
	make clean -C $(LIBFT)
	rm -f $(OBJ)
	rm -rf $(OBJ_DIR)

fclean : clean
	rm -f $(NAME)
	make fclean -C $(LIBFT)

re : fclean all

.PHONY: all clean fclean re
