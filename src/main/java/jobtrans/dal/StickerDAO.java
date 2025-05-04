package jobtrans.dal;

import jobtrans.model.Sticker;
import jobtrans.utils.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class StickerDAO {
    private final DBConnection dbConnection;


    public StickerDAO() {
        this.dbConnection = DBConnection.getInstance();
    }

    public List<Sticker> getAllStickers() {
        List<Sticker> stickers = new ArrayList<>();
        String sql = "SELECT sticker_id, sticker_url, sticker_name FROM Stickers";

        try (PreparedStatement ps = dbConnection.openConnection().prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                Sticker sticker = new Sticker();
                sticker.setStickerId(rs.getInt("sticker_id"));
                sticker.setStickerUrl(rs.getString("sticker_url"));
                sticker.setStickerName(rs.getString("sticker_name"));
                stickers.add(sticker);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return stickers;
    }
}
