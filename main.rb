# Variabel Array global untuk menyimpan atau menampung data
$kamar = []
$status = []
$tgl_pemesanan = []

# fungsi untuk menampilkan semua booking kamar
def show_data
    puts "\t=========== Laporan Status Kamar Hotel ===========\n\n"
    if $kamar.length() <= 0
        puts " -------------------------------- "
        puts "|No | Nomor Kamar | Status Kamar |"
        puts " -------------------------------- "
        puts "|          data kosong           |"
        puts " -------------------------------- "
    else
        indexs = 0
        puts " -------------------------------- "
        puts "|No | Nomor Kamar | Status Kamar |"
        puts " -------------------------------- "
        $kamar.each do |n|
            puts "|#{indexs + 1}  |     #{$kamar[indexs]}     |     #{$status[indexs]}     |"  
            indexs += 1      
        end
        puts " -------------------------------- "
    end
end

# fungsi untuk menampilkan tanggal transaksi
def show_transaction
    puts "\t=========== Laporan Tanggal Transaksi Hotel ===========\n\n"
    if $kamar.length() <= 0
        puts " --------------------------------------------------- "
        puts "|No | Nomor Kamar |               Tanggal           |"
        puts " --------------------------------------------------- "
        puts "|                       data kosong                 |"
        puts " --------------------------------------------------- "
    else
        indexs = 0
        puts " --------------------------------------------------------------------- "
        puts "|No | Nomor Kamar |                       Tanggal                     |"
        puts " --------------------------------------------------------------------- "
        $kamar.each do |n|
            puts "|#{indexs + 1}  |    #{$kamar[indexs]}      | Tanggal Pemesanan : #{$tgl_pemesanan[indexs]}     |"  
            indexs += 1      
        end
        puts " --------------------------------------------------------------------- "
    end
end

# fungsi untuk menambah pemesanan kamar hotel
def insert_data
    puts "\t=========== Pesanan kamar ===========\n\n"
    show_data
    puts "\n\nContoh Kode kamar [101 - 199, 201 - 299, 301 - 399, 401 - 499, 501 - 599]\n\n"

    print "Masukan Nomor Kamar : "
    room_booking = gets.chomp.to_i
    print "Masukan Status Kamar [free/book] : "
    room_status = gets.chomp
    $kamar.append(room_booking)
    $status.append(room_status)
    tgl = Time.now
    $tgl_pemesanan.append(tgl)
end

# fungsi untuk menghapus atau membatalkan pesanan kamar
def cancel_data
    show_data
    puts "\n\n\t=========== Pembatalan Pemesanan Kamar Hotel ===========\n\n"
    print "\n\nMasukan nomor urutan untuk membatalkan pemesanan: "
    indexs = gets.chomp.to_i
    indexs -= 1
    if indexs >= $kamar.length
        print "kamar yang anda pilih belum dibooking"
    else
        $kamar.delete_at(indexs)
        $status.delete_at(indexs)
        $tgl_pemesanan.delete_at(indexs)
        # puts "#{$kamar[indexs]}"
    end
end

# fungsi untuk mengubah data pemesanan kamar hotel
def edit_data
    show_data
    puts "\n\n\t=========== Ubah Status Kamar Hotel ===========\n\n"
    print "\n\nMasukan nomor urutan untuk mengubah data pemesanan: "
    indexs = gets.chomp.to_i
    indexs -= 1
    if indexs >= $kamar.length
        print "kamar yang anda pilih belum dibooking"
    else
        print "Masukan Nomor Kamar: "
        booking_ubah = gets.chomp.to_i
        print "Masukan Status kamar: "
        status_ubah = gets.chomp
        $kamar[indexs] = booking_ubah
        $status[indexs] = status_ubah
    end
end

# fungsi untuk menampilkan menu
def show_menu
    puts "\n\n"
    puts "=========== Selamat Datang FHIZYEL HOTELS, Silahkan masukan pemesanan booking kamar ============\n\n"

    puts "\t\t\t============= Pilih Menu ==============\n\n"
    puts "[1] Pemesanan kamar --> book_room"
    puts "[2] Batalkan Pesanan --> cancel_room"
    puts "[3] Edit Pesanan kamar --> edit_room"
    puts "[4] Laporan Status Booking --> room_status"
    puts "[5] Laporan Transaksi Hotel --> transaction_status"
    puts "[6] Keluar Aplikasi --> exit"

    print "\n\nMASUKAN MENU : "
    # menu = Integer(gets.chomp)
    menu = gets.chomp.to_i

    case menu
    when 1
        insert_data
        puts "\n"
        next_showMenu
    when 2
        cancel_data
        puts "\n"
        next_showMenu
    when 3
        edit_data
        puts "\n"
        next_showMenu
    when 4
        show_data
        puts "\n"
        next_showMenu
    when 5
        show_transaction
        puts "\n"
        next_showMenu
    when 6
        system("clear")
        exit(true)
    else
        puts "Maaf Pilihan Menu anda tidak tersedia, Silahkan coba lagi." 
        next_showMenu 
    end
end

# fungsi menentukan pilihan untuk lanjut ke menu utama atau tidak
def next_showMenu
    print "Apakah Ingin Lanjut?[Y/N]: "
        lanjut = gets.chomp
        
        case lanjut
        when "y" , "Y"
            system("clear")
            # system("cls") /untuk windows
            show_menu
        when "n" , "N"
            system("clear")
            exit(true)
        else
            system("clear")
            # system("cls") /untuk windows
            next_showMenu
        end
end

# pemanggilan Show Menu
show_menu
