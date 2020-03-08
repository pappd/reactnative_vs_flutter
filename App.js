import React, { useState } from "react";
import {
  StyleSheet,
  Text,
  View,
  TextInput,
  Button,
  FlatList
} from "react-native";

export default function App() {
  const [list, setList] = useState([]);
  const [text, setText] = useState("");
  return (
    <View style={mainStyles.container}>
      <View style={mainStyles.row}>
        <TextInput
          style={mainStyles.label}
          onChangeText={newText => setText(newText)}
        />
        <View style={mainStyles.button}>
          <Button title={"Send"} onPress={() => setList([...list, text])} />
        </View>
      </View>
      <FlatList
        data={list}
        renderItem={({ item, index }) => (
          <View style={index % 2 == 0 ? listStyle.row : listStyle.row2}>
            <Text style={listStyle.label}>{item}</Text>
            <View style={mainStyles.button}>
              <Button
                color="orangered"
                title={"Delete"}
                onPress={() => {
                  var newList = [...list];
                  newList.splice(index, 1);
                  setList(newList);
                }}
              />
            </View>
          </View>
        )}
      />
    </View>
  );
}

const mainStyles = StyleSheet.create({
  label: {
    flex: 1,
    marginRight: 15,
    borderBottomColor: "dodgerblue",
    borderBottomWidth: 2,
    fontSize: 18
  },
  button: {
    width: 80,
    fontSize: 18,
    justifyContent: "center"
  },
  row: {
    flexDirection: "row",
    height: 50,
    marginBottom: 14,
    paddingRight: 10,
    paddingLeft: 10
  },
  container: {
    flex: 1,
    marginTop: 50,
    marginLeft: 20,
    marginRight: 20,
    marginBottom: 20,
    backgroundColor: "#fff",
    justifyContent: "center"
  }
});

const listStyle = StyleSheet.create({
  label: {
    ...mainStyles.label,
    borderBottomWidth: 0,
    textAlignVertical: "center"
  },
  row: {
    ...mainStyles.row,
    backgroundColor: "orange",
    borderRadius: 5
  },
  row2: {
    ...mainStyles.row,
    backgroundColor: "gold",
    borderRadius: 5
  }
});
