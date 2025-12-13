ï»؟import os

def is_windows1256(file_path):
    """
    ه°‌è¯•ن»¥ windows-1256 è§£ç پو–‡ن»¶ï¼Œه¦‚و‍œوˆگهٹںن¸”و²،وœ‰ decode é”™è¯¯ï¼Œ
    هˆ™è®¤ن¸؛è¯¥و–‡ن»¶وک¯ windows-1256 ç¼–ç پم€‚
    """
    try:
        with open(file_path, "rb") as f:
            content = f.read()
        content.decode("windows-1256")
        return True
    except Exception:
        return False


def convert_to_utf8_with_bom(file_path):
    """
    ه°† windows-1256 ç¼–ç پçڑ„و–‡ن»¶è½¬وچ¢ن¸؛ UTF-8 with BOMï¼ˆه¸¦ BOMï¼‰م€‚
    """
    with open(file_path, "rb") as f:
        raw_bytes = f.read()

    text = raw_bytes.decode("windows-1256")

    with open(file_path, "w", encoding="utf-8",newline="") as f:
        f.write(text)


def process_folder(root_folder):
    """
    é€’ه½’éپچهژ† root_folder ç›®ه½•ن¸‹و‰€وœ‰و–‡ن»¶ï¼Œ
    ه¦‚و‍œو–‡ن»¶وک¯ Windows-1256 ç¼–ç پï¼Œهˆ™è½¬وچ¢ن¸؛ UTF-8 with BOMï¼›
    ه¦‚و‍œن¸چوک¯ï¼Œهˆ™ن؟‌وŒپهژںو ·م€‚
    """
    for dirpath, dirnames, filenames in os.walk(root_folder):
        for filename in filenames:
            file_path = os.path.join(dirpath, filename)

            # هڈھه¤„çگ†و™®é€ڑو–‡ن»¶
            if not os.path.isfile(file_path):
                continue

            try:
                if is_windows1256(file_path):
                    print(f"è½¬وچ¢ï¼ڑ {file_path}")
                    convert_to_utf8_with_bom(file_path)
                else:
                    print(f"è·³è؟‡ï¼ˆé‌‍1256وˆ–و— و³•è§£ç پï¼‰ï¼ڑ {file_path}")
            except Exception as e:
                print(f"ه¤„çگ†ه¤±è´¥ï¼ڑ {file_path} é”™è¯¯: {e}")


if __name__ == "__main__":
    # è®¾ç½®è¦په¤„çگ†çڑ„و–‡ن»¶ه¤¹è·¯ه¾„
    folder_to_scan = r"E:/code/check_EPT_hook/GuidedHacking-Injector"
    process_folder(folder_to_scan)
    print("ه¤„çگ†ه®Œوˆگم€‚")
