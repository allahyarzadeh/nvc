--
-- TEXTIO package as defined by IEEE 1076-1993
--
package textio is

    type line is access string;

    type text is file of string;

    type side is (RIGHT, LEFT);

    subtype width is natural;

    file input : text open READ_MODE is "STD_INPUT";

    file output : text open WRITE_MODE is "STD_OUTPUT";

    procedure readline (file f: text; l: inout line);

    procedure read (l     : inout line;
                    value : out bit;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out bit );

    procedure read (l     : inout line;
                    value : out bit_vector;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out bit_vector );

    procedure read (l     : inout line;
                    value : out boolean;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out boolean );

    procedure read (l     : inout line;
                    value : out character;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out character );

    procedure read (l     : inout line;
                    value : out integer;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out integer );

    procedure read (l     : inout line;
                    value : out real;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out real );

    procedure read (l     : inout line;
                    value : out string;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out string );

    procedure read (l     : inout line;
                    value : out time;
                    good  : out boolean );
    procedure read (l     : inout line;
                    value : out time );

    procedure writeline (file f : text; l : inout line);

    procedure write (l         : inout line;
                     value     : in bit;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in bit_vector;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in boolean;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in character;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in integer;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in real;
                     justified : in side:= right;
                     field     : in width := 0;
                     digits    : in natural:= 0 );

    procedure write (l         : inout line;
                     value     : in string;
                     justified : in side := right;
                     field     : in width := 0 );

    procedure write (l         : inout line;
                     value     : in time;
                     justified : in side := right;
                     field     : in width := 0;
                     unit      : in time := ns );

end package;

package body textio is

    procedure grow (l        : inout line;
                    extra    : in natural;
                    old_size : out natural ) is
        variable tmp : line;
    begin
        if l = null then
            l := new string(1 to extra);
            old_size := 0;
        elsif extra > 0 then
            old_size := l'length;
            tmp := new string(1 to l'length + extra);
            tmp(1 to l'length) := l.all;
            deallocate(l);
            l := tmp;
        end if;
    end procedure;

    procedure shrink (l : inout line; size : in natural) is
        variable tmp : line;
    begin
        assert l /= null;
        assert size < l'length;
        tmp := new string(1 to size);
        tmp.all := l.all(1 to size);
        deallocate(l);
        l := tmp;
    end procedure;

    procedure consume (l : inout line; nchars : in natural) is
        variable tmp : line;
    begin
        assert l /= null;
        if nchars = l'length then
            tmp := new string'("");
        else
            assert nchars <= l'length;
            tmp := new string(1 to l'length - nchars);
            tmp.all := l.all(1 + nchars to l'length);
        end if;
        deallocate(l);
        l := tmp;
    end procedure;

    function max (a, b : integer) return integer is
    begin
        if a > b then
            return a;
        else
            return b;
        end if;
    end function;

    procedure read (l     : inout line;
                    value : out bit;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out bit )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "bit read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out bit_vector;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out bit_vector )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "bit_vector read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out boolean;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out boolean )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "boolean read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out character;
                    good  : out boolean ) is
    begin
        if l'length > 0 then
            value := l.all(1);
            consume(l, 1);
            good := true;
        else
            good := false;
        end if;
    end procedure;

    procedure read (l     : inout line;
                    value : out character )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "character read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out integer;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out integer )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "integer read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out real;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out real )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "real read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out string;
                    good  : out boolean ) is
    begin
        if value'length <= l'length then
            value := l.all(1 to value'length);
            consume(l, value'length);
            good := true;
        else
            good := false;
        end if;
    end procedure;

    procedure read (l     : inout line;
                    value : out string )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "string read failed";
    end procedure;

    procedure read (l     : inout line;
                    value : out time;
                    good  : out boolean ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure read (l     : inout line;
                    value : out time )
    is
        variable good : boolean;
    begin
        read(l, value, good);
        assert good report "time read failed";
    end procedure;

    procedure readline (file f: text; l: inout line) is
        variable tmp  : line;
        variable ch   : string(1 to 1);
        variable used : natural;
        variable got  : integer;
    begin
        if l /= null then
            deallocate(l);
        end if;

        tmp := new string(1 to 128);
        loop
            exit when endfile(f);

            read(f, ch, got);
            exit when got /= 1;

            next when ch(1) = CR;

            if ch(1) = LF then
                exit;
            else
                if used = tmp'length then
                    grow(tmp, 128, used);
                end if;
                used := used + 1;
                tmp(used) := ch(1);
            end if;
        end loop;

        if used = 0 then
            l := new string'("");
        else
            shrink(tmp, used);
            l := tmp;
        end if;
    end procedure;

    procedure writeline (file f : text; l : inout line) is
    begin
        if l /= null then
            write(f, l.all);
            deallocate(l);
        end if;
        write(f, (1 => LF));   -- Prepend CR on Windows?
        l := new string'("");
    end procedure;

    procedure write (l         : inout line;
                     value     : in string;
                     justified : in side := right;
                     field     : in width := 0 )
    is
        variable orig  : natural;
        variable width : natural;
    begin
        width := max(value'length, field);
        grow(l, width, orig);
        if justified = left then
            l(orig + 1 to orig + value'length) := value;
            for i in orig + value'length + 1 to orig + width loop
                l(i) := ' ';
            end loop;
        else
            for i in orig + 1 to orig + width - value'length loop
                l(i) := ' ';
            end loop;
            l(orig + 1 + width - value'length to orig + width) := value;
        end if;
    end procedure;

    procedure write (l         : inout line;
                     value     : in character;
                     justified : in side := right;
                     field     : in width := 0 ) is
    begin
        write(l, string'(1 => value), justified, field);
    end procedure;

    function bit_to_char (b : bit) return character is
        type table_t is array (bit) of character;
        constant table : table_t := ( '0' => '0',
                                      '1' => '1' );
    begin
        return table(b);
    end function;

    procedure write (l         : inout line;
                     value     : in bit;
                     justified : in side := right;
                     field     : in width := 0 ) is
    begin
        write(l, bit_to_char(value), justified, field);
    end procedure;

    procedure write (l         : inout line;
                     value     : in bit_vector;
                     justified : in side := right;
                     field     : in width := 0 )
    is
        variable s : string(1 to value'length);
        alias v : bit_vector(1 to value'length) is value;
    begin
        for i in s'range loop
            s(i) := bit_to_char(v(i));
        end loop;
        write(l, s, justified, field);
    end procedure;

    procedure write (l         : inout line;
                     value     : in boolean;
                     justified : in side := right;
                     field     : in width := 0 ) is
    begin
        write(l, boolean'image(value), justified, field);
    end procedure;

    function unit_string (unit : time) return string is
    begin
        -- Standard requires unit in lower case
        if unit = fs then
            return " fs";
        elsif unit = ps then
            return " ps";
        elsif unit = ns then
            return " ns";
        elsif unit = us then
            return " us";
        elsif unit = ms then
            return " ms";
        elsif unit = sec then
            return " sec";
        elsif unit = min then
            return " min";
        elsif unit = hr then
            return " hr";
        else
            report "invalid unit " & time'image(unit);
        end if;
    end function;

    procedure write (l         : inout line;
                     value     : in time;
                     justified : in side := right;
                     field     : in width := 0;
                     unit      : in time := ns )
    is
        variable value_time: time := abs(value);
        variable digit_time: time := unit;
        variable str       : string (1 to 22);
        variable pos       : natural := str'left;
        variable digit     : integer;
    begin
        if value < 0 ns then
            str(pos) := '-';
            pos := pos + 1;
        end if;

        while value_time / 10 >= digit_time loop
            digit_time := digit_time * 10;
        end loop;

        while (pos <= str'right) loop
            digit      := value_time / digit_time;
            value_time := value_time - digit * digit_time;
            str(pos)   := character'val(digit + character'pos ('0'));
            pos        := pos + 1;
            exit when value_time = 0 fs and digit_time <= unit;
            if digit_time = unit and pos <= str'right then
                str(pos) := '.';
                pos := pos + 1;
            end if;
            exit when (digit_time / 10) * 10 /= digit_time;
            digit_time := digit_time / 10;
        end loop;
        write(l, str(1 to pos-1) & unit_string(unit), justified, field);
    end procedure;

    procedure write (l         : inout line;
                     value     : in real;
                     justified : in side:= right;
                     field     : in width := 0;
                     digits    : in natural:= 0 ) is
    begin
        -- TODO
        report "unimplemented" severity failure;
    end procedure;

    procedure write (l         : inout line;
                     value     : in integer;
                     justified : in side := right;
                     field     : in width := 0 ) is
    begin
        write(l, integer'image(value), justified, field);
    end procedure;

end package body;
